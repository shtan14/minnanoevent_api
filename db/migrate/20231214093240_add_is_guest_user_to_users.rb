class AddIsGuestUserToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :is_guest_user, :boolean, default: false, null: false
  end
end
