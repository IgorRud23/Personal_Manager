class AddDateTimeToSchedules < ActiveRecord::Migration[5.2]
  def change
    add_column :schedules, :date_time, :string
  end
end
