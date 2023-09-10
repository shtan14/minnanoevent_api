class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.references :user, foreign_key: true
      t.references :event, foreign_key: true
      t.text :comment, null: false
      t.integer :five_star_rate, null: false
      t.timestamps
    end
  end
end
