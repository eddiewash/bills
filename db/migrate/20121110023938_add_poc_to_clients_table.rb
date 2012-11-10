class AddPocToClientsTable < ActiveRecord::Migration
  def change
    add_column :clients, :poc, :string
  end
end
