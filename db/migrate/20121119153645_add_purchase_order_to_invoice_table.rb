class AddPurchaseOrderToInvoiceTable < ActiveRecord::Migration
  def up
    add_column :invoices, :po_number, :string
  end
  
  def down
    remove_column :invoices, :po_number
  end
end
