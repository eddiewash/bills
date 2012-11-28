module EmailsHelper
  include ActionView::Helpers::NumberHelper
  
  def email_subject(invoice, type)
    
    if type == "thanks"
      subject = "Thanks for your business"
    elsif type == "send_invoice"
      subject = "Invoice: #{invoice.job_name}"
    end
    return subject    
  end
  
  def email_message(invoice, type)
    message = ""
    if invoice.po_number?
      message = "PO: #{invoice.po_number}\n"
    end
        
    if type == "thanks"
      message =  message + "Amount: #{number_to_currency(invoice.total)}\nInvoice Date: #{invoice.invoice_date}\nTotal Payments: #{number_to_currency(invoice.total_payments)}\nBalance: #{number_to_currency(invoice.balance)}\n\nThank you for your business. "
    elsif type == "send_invoice"
      message = message + "Amount: #{number_to_currency(invoice.total)}\nInvoice Date: #{invoice.invoice_date}\nDue Date: #{invoice.due_date} "
    end
    return message
  end
end