class InvoiceMailer < ActionMailer::Base
  default from: "steve@relayhr.com"

  def send_invoice(invoice, current_user)
    @invoice = invoice
    @greeting = current_user.full_name

    mail to: current_user.email, subject: "Here is your invoice"
  end
end
