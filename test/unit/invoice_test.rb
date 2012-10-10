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
