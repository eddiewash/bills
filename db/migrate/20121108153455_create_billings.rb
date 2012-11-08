class CreateBillings < ActiveRecord::Migration
  def change
    create_table :billings do |t|
      t.integer :invoice_id

      t.timestamps
    end
  end
end
