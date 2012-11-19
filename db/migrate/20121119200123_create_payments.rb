class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.integer :invoice_id
      t.date :payment_date
      t.decimal :amount
      t.text :note

      t.timestamps
    end
  end
end


