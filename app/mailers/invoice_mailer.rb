class InvoiceMailer < ActionMailer::Base
  default from: "steve@relayhr.com"

  def send_invoice(invoice)
    @invoice = invoice
    @greeting = "Hi"

    mail to: "stevemargc@gmail.com", subject: "Here is your invoice"
  end
end
