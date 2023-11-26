class Event < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :categories
  has_many :comments, dependent: :destroy
  has_many :event_images, dependent: :destroy
  has_many :favourites, dependent: :destroy
  has_many :favourited_by_users, through: :favourites, source: :user

  # 現在のユーザーがお気に入りにしているかどうかを返すメソッド
  def favourite_for?(user)
    return false unless user

    favourites.exists?(user:)
  end

  # 現在のユーザーがお気に入りにした際のお気に入りIDを返すメソッド
  def favourite_id_for(user)
    return nil unless user

    favourites.find_by(user:)&.id
  end
end
