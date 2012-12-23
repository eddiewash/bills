class AppointmentsController < ApplicationController
  
  def index
    appointments = current_user.invoices
    @scheduled_appointments = appointments.where("(invoices.invoice_date IS NULL or invoices.balance != ?) and invoices.appointment_date IS NOT NULL", 0).order("appointment_date ASC")
    @pending_appointments = appointments.where("invoices.invoice_date IS NULL and invoices.appointment_date IS NULL ", 0)
  end
  
  def new
    @invoice = Invoice.new
    if current_user.company == nil
      @invoice.payment_terms = 0
    else
      @invoice.payment_terms = current_user.company.payment_due
      @invoice.tax1 = current_user.company.tax1
      @invoice.tax1 = current_user.company.tax1
    end 
    @invoice.client_id = params[:id] if params[:id]
  end
  
  def create
    @invoice = Invoice.new(params[:invoice])

    if @invoice.save
      redirect_to appointment_path(@invoice), notice: 'Appointment was successfully set.' 
    else
      render :new
    end
  end
  
  def show
    @invoice = Invoice.find(params[:id])
  end
  
  def edit
    @invoice = Invoice.find(params[:id])
  end
  
  def update
    @invoice = Invoice.find(params[:id])

    if @invoice.update_attributes(params[:invoice])
      redirect_to appointment_path(@invoice), notice: 'Appointment was successfully updated.'
    else
      render :edit 
    end
  end
  
    
end
