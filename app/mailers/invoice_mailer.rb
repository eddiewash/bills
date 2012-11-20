class InvoiceMailer < ActionMailer::Base
  default from: "steve@relayhr.com"

  def send_invoice(invoice, email, current_user)
    @invoice = invoice
    @email = email

    
    pdf = InvoicePdf.new(@invoice, view_context)
    attachments["invoice.pdf"] = { :mime_type => 'application/pdf', :content => pdf.render } 

    mail to: @invoice.client.email, subject: email.subject
  end
end
