class CreateEmails < ActiveRecord::Migration
  def change
    create_table :emails do |t|
      t.integer :invoice_id
      t.text :subject
      t.text :message
      
      t.timestamps
    end
  end

end
