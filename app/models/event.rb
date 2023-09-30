class Event < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :categories
  has_many :comments
  has_many :event_images
  has_many :favourites
  has_many :favourited_by_users, through: :favourites, source: :user
end
