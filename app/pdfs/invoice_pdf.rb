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
    notes
    payable_info
  end
  
  def invoice_number
    text "Invoice ##{@invoice.id}", size: 30, style: :bold
    if @invoice.company.logo?
      image @invoice.company.logo
    end
  end
  
  def client_info
    move_down 20
    text "Invoice for:"
    text "#{@invoice.client.client_name}"
    text "#{@invoice.client.address1}"
    text "#{@invoice.client.address2}"
    text "#{@invoice.client.city}, #{@invoice.client.state}"
  end
  
  def line_items
    move_down 20
    table line_item_rows do
      row(0).font_style = :bold
      columns(1..3).align = :right
      column(0).width = 280
      column(1).width = 60
      column(2..3).width = 100
      self.row_colors = ["DDDDDD", "FFFFFF"]
      self.header = true
    end
  end
  
  def line_item_rows
    [["Item", "Qty", "Unit Price", "Total Unit Cost"]] +
    @invoice.items.map do |item|
      [item.name, item.quantity, price(item.cost_per), 
        price(item.total_cost) +
        if item.tax1 && item.tax2
          "\u00B9 \u00B2 "
        elsif item.tax1
          "\u00B9"
        elsif item.tax2
          "\u00B2"
        end
        ]
    end
  end
  
  def price(num)
    @view.number_to_currency(num)
  end
  
  def total_price
    table total_item_row do
      row(0).font_style = :bold
      columns(0).align = :right
      column(0).width = 540
    end
  end
  
  def total_item_row
    [["Subtotal: #{price(@invoice.subtotal)}\nTax \u00B9: #{price(@invoice.total_tax1)}\nTax \u00B2: #{price(@invoice.total_tax2)}\nTotal Billed Amount: #{price(@invoice.total)}"]]
  end
  
  
  
  def notes
    move_down 20
    if @invoice.notes?
      text "Notes:"
      text "#{@invoice.notes}"
    end
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
    text "Payment Due:  #{(Time.now + (@invoice.company.payment_due).days).strftime("%m/%d/%Y")}"
    
    
    
    
    
    
  end
end