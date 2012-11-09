class AddTotalCostToItemsTable < ActiveRecord::Migration
  def change
    add_column :items, :total_cost, :decimal
  end
end
