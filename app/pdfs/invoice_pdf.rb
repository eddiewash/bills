class InvoicePdf < Prawn::Document
  def initialize(invoice)
    super()
    @invoice = invoice
    text "Invoice #{@invoice.id}"
  end
  
end