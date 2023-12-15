require "validator/email_validator"

class User < ApplicationRecord
  include TokenGenerateService
  attr_accessor :activation_token

  before_validation :downcase_email
  before_create :create_activation_digest
  has_secure_password

  validates :name, presence: true,
                   length: { maximum: 30, allow_blank: true }
  validates :email, presence: true,
                    email: { allow_blank: true }

  VALID_PASSWORD_REGEX = /\A[\w-]+\z/
  validates :password, presence: true,
                       length: { minimum: 8 },
                       format: {
                         with: VALID_PASSWORD_REGEX,
                         message: :invalid_password
                       },
                       allow_nil: true

  has_one :user_profile, dependent: :destroy
  has_many :events, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favourites, dependent: :destroy
  has_many :favourite_events, through: :favourites, source: :event
## methods
  # class method  ###########################
  class << self
    # emailからアクティブなユーザーを返す
    def find_by_activated(email)
      find_by(email:, activated: true)
    end
  end
  # class method end #########################

  # 自分以外の同じemailのアクティブなユーザーがいる場合にtrueを返す
  def email_activated?
    users = User.where.not(id:)
    users.find_by_activated(email).present?
  end

  def remember(jti)
    update!(refresh_jti: jti)
  end

  def forget
    update!(refresh_jti: nil)
  end

  def response_json(payload = {})
    as_json(only: %i[id name is_guest_user], include: { user_profile: { only: :avatar } })
      .merge(payload).with_indifferent_access
  end

  def authenticated?(attribute, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?

    BCrypt::Password.new(digest).is_password?(token)
  end

  private

  # email小文字化
    def downcase_email
      email&.downcase!
    end

    def create_activation_digest
      self.activation_token  = User.new_token
      self.activation_digest = User.digest(activation_token)
    end

    class << self
      def User.new_token
        SecureRandom.urlsafe_base64
      end

      # 与えられた文字列のダイジェストを返すクラスメソッド
      def User.digest(string)
        cost = if ActiveModel::SecurePassword.min_cost
                 BCrypt::Engine::MIN_COST
               else
                 BCrypt::Engine.cost
               end
        BCrypt::Password.create(string, cost:)
      end
    end
end
