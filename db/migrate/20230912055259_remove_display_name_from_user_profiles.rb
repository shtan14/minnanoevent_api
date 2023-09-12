class RemoveDisplayNameFromUserProfiles < ActiveRecord::Migration[7.0]
  def change
    remove_column :user_profiles, :display_name, :string
  end
end
