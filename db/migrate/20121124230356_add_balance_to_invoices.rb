class AddBalanceToInvoices < ActiveRecord::Migration
  def up
    add_column :invoices, :balance, :decimal
    add_column :invoices, :total_payments, :decimal
  end
  
  def down
    remove_column :invoices, :balance
    remove_column :invoices, :total_payments
  end
end
