class InvoiceMailer < ActionMailer::Base
  default from: "steve@relayhr.com"

  def send_invoice(recipient, invoice, email, current_user)
    @invoice = invoice
    @email = email
    @recipient = recipient  
    pdf = InvoicePdf.new(@invoice, view_context)
    attachments["invoice.pdf"] = { :mime_type => 'application/pdf', :content => pdf.render } 
    email_with_name = "#{@recipient.name} <#{@recipient.email}>"
    mail to: email_with_name, subject: @email.subject
  end
  
  def contact_us(contact)
    @contact = contact
    mail to: 'stevemargc@gmail.com', subject: 'Contact Us Submission'
  end
end
