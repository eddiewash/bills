class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :client_name
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.text :notes

      t.timestamps
    end
  end
end
