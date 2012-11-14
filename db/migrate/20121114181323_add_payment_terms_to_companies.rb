class AddPaymentTermsToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :payment_due, :integer
  end
end
