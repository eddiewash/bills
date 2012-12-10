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
  
  def mail
    @invoice = Invoice.find(params[:id])
    if current_user.company == nil || @invoice.payment_terms == nil
      @invoice.payment_terms = 0
    end
    @invoice.invoice_date = Date.today
    @invoice.due_date = @invoice.invoice_date + (@invoice.payment_terms).days
    gon.invoice = Invoice.find(params[:id])
  end

  def new
    @invoice = Invoice.new
    if current_user.company == nil
      @invoice.payment_terms = 0
    else
      @invoice.payment_terms = current_user.company.payment_due
      @invoice.tax1 = current_user.company.tax1
      @invoice.tax1 = current_user.company.tax1
    end   
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
    if params[:commit]== "Mail Invoice" && params[:invoice][:invoice_date]==""
      params[:invoice][:invoice_date] = Date.today
    end
    if @invoice.update_attributes(params[:invoice])
      redirect_to @invoice, notice: 'Invoice was successfully updated.'
    else
      render :edit 
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
