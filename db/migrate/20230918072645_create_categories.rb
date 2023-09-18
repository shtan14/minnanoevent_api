class CreateCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |t|
      t.references :event, foreign_key: true
      t.string :category, null: false
      t.timestamps
    end
  end
end
