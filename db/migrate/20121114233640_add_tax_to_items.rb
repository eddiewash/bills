class AddTaxToItems < ActiveRecord::Migration
  def change
    add_column :items, :tax1, :boolean, :default => false
    add_column :items, :tax2, :boolean, :default => false
  end
end
