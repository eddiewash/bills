class InvoiceMailer < ActionMailer::Base
  default from: "steve@relayhr.com"

  def send_invoice(invoice, balance, current_user)
    @invoice = invoice
    if @invoice.client.poc?
      @greeting = @invoice.client.poc
    else
      @greeting = @invoice.client.client_name
    end
    
    @balance = balance
    pdf = InvoicePdf.new(@invoice, @balance, view_context)
    attachments["invoice.pdf"] = { :mime_type => 'application/pdf', :content => pdf.render } 

    mail to: @invoice.client.email, subject: "Here is your invoice"
  end
end
