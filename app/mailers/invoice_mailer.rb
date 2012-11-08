class InvoiceMailer < ActionMailer::Base
  default from: "steve@relayhr.com"

  def send_invoice(invoice, balance, current_user)
    @invoice = invoice
    @greeting = current_user.full_name
    @balance = balance
    pdf = InvoicePdf.new(@invoice, @balance, view_context)
    attachments["invoice.pdf"] = { :mime_type => 'application/pdf', :content => pdf.render } 

    mail to: current_user.email, subject: "Here is your invoice"
  end
end
