class InvoicePdf < Prawn::Document
  def initialize(invoice, total, view)
    super(top_margin: 70)
    @invoice = invoice
    @view = view
    @total_price = total
    invoice_number
    client_info
    line_items
    total_price
    payable_info
  end
  
  def invoice_number
    text "Invoice ##{@invoice.id}", size: 30, style: :bold
  end
  
  def client_info
    text "Client Name: #{@invoice.client.client_name}"
    text "#{@invoice.client.address1}"
    text "#{@invoice.client.address2}"
    text "#{@invoice.client.city}, #{@invoice.client.state}"
  end
  
  def line_items
    move_down 20
    table line_item_rows do
      row(0).font_style = :bold
      columns(1..2).align = :right
      self.row_colors = ["DDDDDD", "FFFFFF"]
      self.header = true
    end
  end
  
  def line_item_rows
    [["Item", "Qty", "Unit Price", "Total Unit Cost"]] +
    @invoice.items.map do |item|
      [item.name, item.quantity, price(item.cost_per), price(item.total_cost)]
    end
  end
  
  def price(num)
    @view.number_to_currency(num)
  end
  
  def total_price
    move_down 20
    text "Total Billed Amount: #{price(@total_price)}", size: 16, style: :bold
  end
  
  def payable_info
    move_down 20
    text "Make check payable to:"
    text "#{@invoice.company.name}"
    text "#{@invoice.company.address1}"
    if @invoice.company.address2?
      text "#{@invoice.company.address2}"
    end
    text "#{@invoice.company.city}, #{@invoice.company.state}"
    
    
    
    
    
    
  end
end