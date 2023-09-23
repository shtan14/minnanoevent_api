class CreateCategoriesEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :categories_events, id: false do |t|
      t.references :category, foreign_key: true
      t.references :event, foreign_key: true
      t.timestamps
    end
  end
end
