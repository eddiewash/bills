class ClientsController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :create, :show, :edit, :update]
  
  # GET /clients
  # GET /clients.json
  def index
    @search = current_user.clients.search(params[:q])
    @clients = @search.result
  end

  def show
    @client = Client.find(params[:id])
    @contacts = @client.contacts.all
    invoices = @client.invoices
    @open_invoices = invoices.where("invoices.invoice_date IS NULL or invoices.balance != ?", 0)
    @closed_invoices = invoices.where("invoices.balance = ? and invoices.invoice_date IS NOT NULL", 0)
    
    unless current_user.id == @client.user_id
      flash[:notice] = "You don't have access to that client"
      redirect_to clients_path
      return
    end


  end

  # GET /clients/new
  # GET /clients/new.json
  def new
    @client = Client.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @client }
    end
  end

  # GET /clients/1/edit
  def edit
    @client = Client.find(params[:id])
    unless current_user.id == @client.user_id
      flash[:notice] = "You don't have access to that client"
      redirect_to clients_path
      return
    end
  end

  # POST /clients
  # POST /clients.json
  def create
    @client = current_user.clients.new(params[:client])

    respond_to do |format|
      if @client.save
        format.html { redirect_to @client, notice: 'Client was successfully created.' }
        format.json { render json: @client, status: :created, location: @client }
      else
        format.html { render action: "new" }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /clients/1
  # PUT /clients/1.json
  def update
    @client = Client.find(params[:id])

    respond_to do |format|
      if @client.update_attributes(params[:client])
        format.html { redirect_to @client, notice: 'Client was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clients/1
  # DELETE /clients/1.json
  def destroy
    @client = Client.find(params[:id])
    @client.destroy

    respond_to do |format|
      format.html { redirect_to clients_url }
      format.json { head :no_content }
    end
  end
end
