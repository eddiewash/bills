class AddTaxToInvoices < ActiveRecord::Migration
  def change
    add_column :invoices, :tax1, :decimal
    add_column :invoices, :tax2, :decimal
  end
end
