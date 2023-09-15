class RenameReviewsToComments < ActiveRecord::Migration[7.0]
  def change
    rename_table :reviews, :comments
    remove_column :comments, :five_star_rate  
  end
end
