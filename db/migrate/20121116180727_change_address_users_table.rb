class ChangeAddressUsersTable < ActiveRecord::Migration
  def up
    add_column :users, :address, :text
    
    remove_column :users, :address1
    remove_column :users, :address2
    remove_column :users, :city
    remove_column :users, :state
    remove_column :users, :zip 
     
  end

  def down
    remove_column :users, :address
    
    add_column :users, :address1, :string
    add_column :users, :address2, :string
    add_column :users, :city, :string
    add_column :users, :state, :string
    add_column :users, :zip, :string
  end
end
