class AddAppointmentDateToInvoices < ActiveRecord::Migration
  def up
    add_column :invoices, :appointment_date, :datetime
    add_column :invoices, :appointment_time, :time
    
  end

  def down
    remove_column :invoices, :appointment_date
    remove_column :invoices, :appointment_time
  end
end
