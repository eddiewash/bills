class CreateContacts < ActiveRecord::Migration

  def change
    create_table :contacts do |t|
      t.string :name
      t.string :email
      t.string :phone_work
      t.string :phone_cell
      t.text :notes
      t.integer :client_id
    end
  end
end
