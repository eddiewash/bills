class RemoveFieldsFromClients < ActiveRecord::Migration
  def up
    remove_column :clients, :email
    remove_column :clients, :phone
    remove_column :clients, :poc
  end

  def down
    add_column :clients, :email, :string
    add_column :clients, :phone, :string
    add_column :clients, :phone, :string
  end
end
