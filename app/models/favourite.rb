class Favourite < ApplicationRecord
  belongs_to :user
  belongs_to :event

  after_create :increment_favourites_count
  after_destroy :decrement_favourites_count

  private

  def increment_favourites_count
    event.increment!(:favourites_count)
  end

  def decrement_favourites_count
    event.decrement!(:favourites_count)
  end
end
