module EmailsHelper
  
  def email_subject(invoice)
    subject = "Invoice: #{invoice.job_name}"
    return subject    
  end
  
  def email_message(invoice)
    message = "jkdfhjkjdhfjjj\nline2\nline3"
    return message
  end
end