class AddHeightToClients < ActiveRecord::Migration[5.2]
  def change
    add_column :clients, :height, :integer
  end
end
