class AddAgeToClients < ActiveRecord::Migration[5.2]
  def change
    add_column :clients, :age, :integer
  end
end
