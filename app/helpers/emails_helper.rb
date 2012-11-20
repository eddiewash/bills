module EmailsHelper
  include ActionView::Helpers::NumberHelper
  
  def email_subject(invoice)
    subject = "Invoice: #{invoice.job_name}"
    return subject    
  end
  
  def email_message(invoice)
    message = "PO: #{invoice.po_number}\nAmount: #{number_to_currency(invoice.total)}"
    return message
  end
end