class AddInvoiceDateToInvoices < ActiveRecord::Migration
  def up
    add_column :invoices, :invoice_date, :date
  end
  
  def down
    remove_column :invoices, :invoice_date
  end
end
