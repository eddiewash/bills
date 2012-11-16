class ChangeAddressOnTables < ActiveRecord::Migration
  def up
    add_column :companies, :address, :text
    add_column :clients, :address, :text  

    remove_column :clients, :address1
    remove_column :clients, :address2
    remove_column :clients, :city
    remove_column :clients, :state
    remove_column :clients, :zip
    remove_column :companies, :address1
    remove_column :companies, :address2
    remove_column :companies, :city
    remove_column :companies, :state
    remove_column :companies, :zip

  end

  def down
    add_column :clients, :address1, :string
    add_column :clients, :address2, :string
    add_column :clients, :city, :string
    add_column :clients, :state, :string
    add_column :clients, :zip, :string
    add_column :companies, :address1, :string
    add_column :companies, :address2, :string
    add_column :companies, :city, :string
    add_column :companies, :state, :string
    add_column :companies, :zip, :string

    remove_column :clients, :address
    remove_column :clients, :address

  end

end
