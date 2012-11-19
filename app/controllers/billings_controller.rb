class BillingsController < ApplicationController
  
  def create
 
    @invoice = Invoice.find(params[:invoice_id])

    @billing = Billing.new(:invoice_id => params[:invoice_id])

      if @billing.save
        InvoiceMailer.send_invoice(@invoice, current_user).deliver
        redirect_to invoices_path, notice: 'Email was sent.' 
      else
        redirect_to invoices_path
      end
  end

end