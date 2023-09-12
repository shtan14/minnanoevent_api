class AddDefaultAndNotNullToAvatar < ActiveRecord::Migration[7.0]
  def change
    change_column :user_profiles, :avatar, :string, default: "", null: false
  end
end
