class CreateUserProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :user_profiles do |t|
      t.references :user, foreign_key: true
      t.string :display_name, null: false, limit: 255
      t.text :bio, null: false, default: ""
      t.string :social_media_links, null: false, limit: 255
      t.string :avatar, limit: 255
      t.timestamps
    end
  end
end
