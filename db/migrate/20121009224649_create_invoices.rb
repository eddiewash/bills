class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.string :job_name
      t.text :notes
      t.date :service_date
      t.integer :client_id

      t.timestamps
    end
  end
end
