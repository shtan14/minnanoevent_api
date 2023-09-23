class ChangeEventColumnsToDatetime < ActiveRecord::Migration[7.0]
  def change
    remove_column :events, :event_start_date
    remove_column :events, :event_start_time
    remove_column :events, :event_end_date
    remove_column :events, :event_end_time

    add_column :events, :event_start_datetime, :datetime, null: false
    add_column :events, :event_end_datetime, :datetime, null: false
  end
end
