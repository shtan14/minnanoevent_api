class RemoveColumnsAndAddPhoneNumberToEvents < ActiveRecord::Migration[7.0]
  def change
    remove_column :events, :comments_count, :integer
    remove_column :events, :average_rating, :integer

    # 電話番号のカラムを追加
    add_column :events, :phone_number, :string
  end
end
