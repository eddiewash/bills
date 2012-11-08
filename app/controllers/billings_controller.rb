class BillingsController < ApplicationController
  
  def create
    @invoice = Invoice.find(params[:invoice][:invoice_id])
    @balance = 0
    @invoice.items.each do |i|
      @balance = @balance + (i.quantity * i.cost_per) 
    end
    @billing = Billing.new(params[:invoice])

      if @billing.save
        InvoiceMailer.send_invoice(@invoice, @balance, current_user).deliver
        redirect_to invoices_path, notice: 'Email was sent.' 
      else
        redirect_to invoices_path
      end
  end

end