class ChangeZipTypeToStringInClientsTable < ActiveRecord::Migration
    def up
      change_column :clients, :zip, :string
    end

    def down
      change_column :clients, :zip, :integer
    end
  end
