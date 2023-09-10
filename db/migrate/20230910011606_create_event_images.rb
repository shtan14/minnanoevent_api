class CreateEventImages < ActiveRecord::Migration[7.0]
  def change
    create_table :event_images do |t|
      t.references :event, foreign_key: true
      t.string :event_image, null: false
      t.timestamps
    end
  end
end
