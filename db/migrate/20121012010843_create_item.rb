class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.integer :quantity
      t.decimal :cost_per
      t.integer :client_id
      
      t.timestamps
    end      
  end
end
