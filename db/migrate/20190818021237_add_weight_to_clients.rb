class AddWeightToClients < ActiveRecord::Migration[5.2]
  def change
    add_column :clients, :weight, :integer
  end
end
