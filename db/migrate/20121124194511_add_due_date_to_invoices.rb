class AddDueDateToInvoices < ActiveRecord::Migration
  def up
    add_column :invoices, :due_date, :date
  end
  
  def down
    remove_column :invoices, :due_date
  end
end
