class AddCloseToInvoices < ActiveRecord::Migration
  def change
    add_column :invoices, :close, :boolean, :default => false
  end
end
