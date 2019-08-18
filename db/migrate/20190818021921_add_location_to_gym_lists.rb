class AddLocationToGymLists < ActiveRecord::Migration[5.2]
  def change
    add_column :gym_lists, :location, :string
  end
end
