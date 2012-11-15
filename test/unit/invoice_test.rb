# == Schema Information
#
# Table name: invoices
#
#  id           :integer          not null, primary key
#  job_name     :string(255)
#  notes        :text
#  service_date :date
#  client_id    :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  total        :decimal(, )
#  tax1         :decimal(, )
#  tax2         :decimal(, )
#  subtotal     :decimal(, )
#  total_tax1   :decimal(, )
#  total_tax2   :decimal(, )
#

require 'test_helper'

class InvoiceTest < ActiveSupport::TestCase
  test "test that an invoice requires a job name" do
    invoice = Invoice.new
    assert !invoice.save
    assert !invoice.errors[:job_name].empty?
  end
  
  test "test that an invoice requires a service date" do
    invoice = Invoice.new
    assert !invoice.save
    assert !invoice.errors[:service_date].empty?
  end
end
