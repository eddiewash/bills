class EmailsController < ApplicationController
  include EmailsHelper

  def new
    @invoice = Invoice.find(params[:invoice_id])
    if !@invoice.invoice_date?
      @invoice.invoice_date = Date.today
      @invoice.due_date = Date.today + (@invoice.payment_terms).days
    end
    @email = Email.new
    @invoice.contacts.where("contacts.email != ?", "").each { |c| @email.email_recipients.build(contact_id: c.id) }
    @email.subject = email_subject(@invoice, params[:type])
    @email.message = email_message(@invoice, params[:type])
    @email.email_type = params[:type]
  end

  def create
    @invoice = Invoice.find(params[:invoice_id])
    @email = Email.new(params[:email])
    @email.invoice_id = params[:invoice_id]
    if !@invoice.invoice_date?
      @invoice.invoice_date = Date.today
      @invoice.due_date = Date.today + (@invoice.payment_terms).days
    end

    if @email.save
      @email.email_recipients.each do |recipient|
        r = Contact.find(recipient.contact_id)
        InvoiceMailer.send_invoice(r, @invoice, @email, current_user).deliver
      end
      @invoice.save
      redirect_to invoice_path(@email.invoice_id), notice: 'Email was sent.'
    else
      render :new
    end
  end

end
