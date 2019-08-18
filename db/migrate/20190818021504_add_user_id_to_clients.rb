class AddUserIdToClients < ActiveRecord::Migration[5.2]
  def change
    add_column :clients, :user_id, :bigint
  end
end
