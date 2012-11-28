module InvoicesHelper
  
  def invoice_status(invoice)
    if invoice.balance == 0 && invoice.invoice_date?
      return "Closed"
    elsif !invoice.invoice_date?
      return content_tag( :div, "Draft", :class => "blue")
    elsif (invoice.due_date < Date.today if invoice.due_date?)
      return content_tag( :div, "Past Due", :class => "red")
    else
      return content_tag( :div, "Sent", :class => "green")
    end
  end
  
end
