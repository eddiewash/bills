class MainController < ApplicationController

  def index
    @search = current_user.clients.search(params[:q])
    @clients = @search.result
    invoices = current_user.invoices
    @scheduled_appointments = invoices.where("(invoices.invoice_date IS NULL or invoices.balance != ?) and invoices.appointment_date IS NOT NULL", 0).order("appointment_date ASC, appointment_time ASC")
    @open_invoices = invoices.where("(invoices.invoice_date IS NULL or invoices.balance != ?) and invoices.close != ?", 0, true)
    
  end


end