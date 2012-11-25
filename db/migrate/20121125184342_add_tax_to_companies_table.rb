class AddTaxToCompaniesTable < ActiveRecord::Migration
  def up
    add_column :companies, :tax1, :decimal
    add_column :companies, :tax2, :decimal
    
  end
  
  def down
    remove_column :companies, :tax1
    remove_column :companies, :tax2
  end
end
