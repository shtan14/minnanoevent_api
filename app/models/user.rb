require "validator/email_validator"

class User < ApplicationRecord
  include TokenGenerateService
  before_validation :downcase_email
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

  has_one :user_profile  # UserProfileモデルとの関連付け
  has_many :events
  has_many :comments
  has_many :favourites
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
    as_json(only: %i[id name]).merge(payload).with_indifferent_access
  end

  private

  # email小文字化
    def downcase_email
      email&.downcase!
    end
end
