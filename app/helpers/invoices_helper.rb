module InvoicesHelper
  
  def balance(invoice)
    balance = invoice.total
    invoice.payments.each do |p|
      balance = balance - p.amount
    end   
    return balance
  end
  
end
