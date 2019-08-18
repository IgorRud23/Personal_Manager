class AddNameToGymLists < ActiveRecord::Migration[5.2]
  def change
    add_column :gym_lists, :name, :string
  end
end
