class AddEmailPhoneZipToClients < ActiveRecord::Migration
  def change
    add_column :clients, :zip, :integer
    add_column :clients, :email, :string
    add_column :clients, :phone, :integer
  end
end
