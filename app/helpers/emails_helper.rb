module EmailsHelper
  include ActionView::Helpers::NumberHelper
  
  def email_subject(invoice, type)
    
    if type = "thanks"
      subject = "Thanks for your business"
    elsif type = "send_invoice"
      subject = "Invoice: #{invoice.job_name}"
    end
    return subject    
  end
  
  def email_message(invoice)
    message = "PO: #{invoice.po_number}\nAmount: #{number_to_currency(invoice.total)}\nInvoice Date: #{invoice.invoice_date}\nDue Date: #{invoice.due_date} "
    return message
  end
end