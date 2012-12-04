class AddLatLongToClients < ActiveRecord::Migration
  def up
    add_column :clients, :latitude, :float
    add_column :clients, :longitude, :float
  end
  
  def down
    remove_column :clients, :latitude
    remove_column :clients, :longitude
  end
end
