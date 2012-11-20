module EmailsHelper
  
  def email_subject(invoice)
    subject = "Invoice: #{invoice.job_name}"
    return subject    
  end
  
  def email_message(invoice)
    message = "PO: #{invoice.po_number}\nAmount: #{invoice.total}"
    return message
  end
end