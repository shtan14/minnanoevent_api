class AddSnsLinksToUserProfiles < ActiveRecord::Migration[7.0]
  def change
    add_column :user_profiles, :x_link, :string, null: false, default: ""
    add_column :user_profiles, :facebook_link, :string, null: false, default: ""
    add_column :user_profiles, :instagram_link, :string, null: false, default: ""
  end
end
