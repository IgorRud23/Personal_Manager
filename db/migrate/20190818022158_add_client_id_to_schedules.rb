class AddClientIdToSchedules < ActiveRecord::Migration[5.2]
  def change
    add_column :schedules, :client_id, :integer
  end
end
