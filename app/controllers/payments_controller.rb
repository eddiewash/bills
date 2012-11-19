class PaymentsController < ApplicationController
  
  def new
 
    @invoice = Invoice.find(params[:invoice_id])
    @payment = Payment.new
  end
  
  
  
  
  def create

    @payment = Payment.new(params[:payment])
    @payment.invoice_id = params[:invoice_id]

      if @payment.save
        redirect_to invoices_path, notice: 'Payment was posted.' 
      else
        render :new
      end
  end

end