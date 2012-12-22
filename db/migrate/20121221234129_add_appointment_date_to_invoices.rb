class AddAppointmentDateToInvoices < ActiveRecord::Migration
  def up
    add_column :invoices, :appointment_date, :datetime
  end

  def down
    remove_column :invoices, :appointment_date
  end
end
