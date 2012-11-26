class InvoicesController < ApplicationController
  # GET /invoices
  # GET /invoices.json
  def index
    invoices = current_user.invoices
    @open_invoices = invoices.where("invoices.invoice_date IS NULL or invoices.balance != ?", 0)
    @closed_invoices = invoices.where("invoices.balance = ? and invoices.invoice_date IS NOT NULL", 0)
   
  end

  # GET /invoices/1
  # GET /invoices/1.json
  def show
    @billing = Billing.new
    @invoice = Invoice.find(params[:id])

    respond_to do |format|
      format.html
      format.pdf do
        pdf = InvoicePdf.new(@invoice, view_context)
        send_data pdf.render, :filename => "invoice_#{@invoice.id}.pdf", 
                              :type => 'application/pdf',
                              :disposition => 'inline'
      end
    end
  end

  # GET /invoices/new
  # GET /invoices/new.json
  def new
    @invoice = Invoice.new
    @invoice.payment_terms = current_user.company.payment_due
    @invoice.tax1 = current_user.company.tax1
    @invoice.tax2 = current_user.company.tax2
    
  end

  # GET /invoices/1/edit
  def edit
    @invoice = Invoice.find(params[:id])
  end

  # POST /invoices
  # POST /invoices.json
  def create
    @invoice = Invoice.new(params[:invoice])

    respond_to do |format|
      if @invoice.save
        format.html { redirect_to @invoice, notice: 'Invoice was successfully created.' }
        format.json { render json: @invoice, status: :created, location: @invoice }
      else
        format.html { render action: "new" }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /invoices/1
  # PUT /invoices/1.json
  def update
    @invoice = Invoice.find(params[:id])

    respond_to do |format|
      if @invoice.update_attributes(params[:invoice])
        format.html { redirect_to @invoice, notice: 'Invoice was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invoices/1
  # DELETE /invoices/1.json
  def destroy
    @invoice = Invoice.find(params[:id])
    @invoice.destroy

    respond_to do |format|
      format.html { redirect_to invoices_url }
      format.json { head :no_content }
    end
  end
  

end
