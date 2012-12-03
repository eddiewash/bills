class ContactsController < ApplicationController
  
  def index
    @client = Client.find(params[:client_id])
    @contacts = @client.contacts.all
  end
   
  def new
    @client = Client.find(params[:client_id])
    @contact = Contact.new
  end
    
  def create
    @client = Client.find(params[:client_id])
    @contact = Contact.new(params[:contact])
    @contact.client_id = params[:client_id]

    if @contact.save
      redirect_to client_path(@client), notice: 'Contact was added.' 
    else
      render :new
    end

  end
  
  def show
    @client = Client.find(params[:client_id])
    @contact = @client.contacts.find(params[:id])
  end
  
  def edit
    @client = Client.find(params[:client_id])
    @contact = @client.contacts.find(params[:id])    

  end
  
  def update
    @client = Client.find(params[:client_id])
    @contact = Contact.find(params[:id])
    if @contact.update_attributes(params[:contact])
      redirect_to client_contact_path(@client, @contact), notice: 'Contact was successfully updated.'
    else
      render :edit
    end
    
  end
  
  def destroy
    @client = Client.find(params[:client_id])
    @contact = Contact.find(params[:id])
    @contact.destroy
    redirect_to client_path(@client)
  end
  
end