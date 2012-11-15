class AddTotalsToInvoices < ActiveRecord::Migration
  def change
    add_column :invoices, :subtotal, :decimal
    add_column :invoices, :total_tax1, :decimal
    add_column :invoices, :total_tax2, :decimal
  end
end
