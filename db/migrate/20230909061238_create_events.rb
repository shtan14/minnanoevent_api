class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.references :user, foreign_key: true
      t.string :title, null: false, limit: 255
      t.text :description, null: false
      t.date :event_start_date, null: false
      t.time :event_start_time, null: false
      t.date :event_end_date, null: false
      t.time :event_end_time, null: false
      t.string :prefecture, null: false
      t.string :city, null: false
      t.string :location, null: false, limit: 255
      t.string :category, limit: 50
      t.integer :ticket_price
      t.integer :average_rating
      t.integer :favourites_count
      t.integer :comments_count
      t.timestamps
    end
  end
end
