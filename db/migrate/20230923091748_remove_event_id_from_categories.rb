class RemoveEventIdFromCategories < ActiveRecord::Migration[7.0]
  def change
    remove_column :categories, :event_id, :bigint
  end
end
