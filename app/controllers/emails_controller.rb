class EmailsController < ApplicationController
  
  def new
    @email = Email.new
  end
  
  def create
    @email = Email.new(params[:email])
    @email.invoice_id = params[:invoice_id]

      if @email.save
        redirect_to invoice_path(@email.invoice_id), notice: 'Email was posted.' 
      else
        render :new
      end
  end

end