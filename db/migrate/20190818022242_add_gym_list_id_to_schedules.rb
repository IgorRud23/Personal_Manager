class AddGymListIdToSchedules < ActiveRecord::Migration[5.2]
  def change
    add_column :schedules, :gym_list_id, :integer
  end
end
