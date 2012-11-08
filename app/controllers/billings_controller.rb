class BillingsController < ApplicationController
  
  def create
    @billing = Billing.new(params[:invoice])

      if @billing.save
        redirect_to invoices_path, notice: 'Billing was successfully created.' 
      else
        redirect_to invoices_path
      end
  end

end