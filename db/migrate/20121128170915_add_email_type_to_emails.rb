class AddEmailTypeToEmails < ActiveRecord::Migration
  def up
    add_column :emails, :email_type, :string
  end
  
  def down
    remove_column :emails, :email_type
  end
end
