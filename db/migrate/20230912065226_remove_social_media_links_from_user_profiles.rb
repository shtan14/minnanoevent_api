class RemoveSocialMediaLinksFromUserProfiles < ActiveRecord::Migration[7.0]
  def change
    remove_column :user_profiles, :social_media_links, :string
  end
end
