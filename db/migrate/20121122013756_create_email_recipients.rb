class CreateEmailRecipients < ActiveRecord::Migration
  def change
    create_table :email_recipients do |t|
      t.integer :email_id
      t.integer :contact_id
    end
  end
end
