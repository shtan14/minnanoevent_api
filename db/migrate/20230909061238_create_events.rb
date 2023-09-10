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
      t.string :prefecture, default: "", null: false
      t.string :city, default: "", null: false
      t.string :location, default: "", null: false, limit: 255
      t.string :category, default: "", null: false, limit: 50
      t.integer :ticket_price, default: 0, null: false
      t.integer :average_rating, default: "0.0", null: false
      t.integer :favourites_count, default: 0, null: false
      t.integer :comments_count, default: 0, null: false
      t.timestamps
    end
  end
end
