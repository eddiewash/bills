class ChangeQuantityTypeOnItemsTable < ActiveRecord::Migration
  def up
    change_column :items, :quantity, :decimal
  end

  def down
    change_column :items, :quantity, :integer
  end
end
