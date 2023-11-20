class Event < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :categories
  has_many :comments, dependent: :destroy
  has_many :event_images, dependent: :destroy
  has_many :favourites, dependent: :destroy
  has_many :favourited_by_users, through: :favourites, source: :user
end
