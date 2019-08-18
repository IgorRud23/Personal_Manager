class AddDateDayToSchedules < ActiveRecord::Migration[5.2]
  def change
    add_column :schedules, :date_day, :date
  end
end
