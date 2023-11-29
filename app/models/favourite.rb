class Favourite < ApplicationRecord
  belongs_to :user
  belongs_to :event

  after_create :increment_favourites_count
  after_destroy :decrement_favourites_count

  private

    def increment_favourites_count
      event.favourites_count = event.favourites_count + 1
      event.save
    end

    def decrement_favourites_count
      event.favourites_count = event.favourites_count - 1
      event.save
    end
end
