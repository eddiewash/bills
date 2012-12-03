class CompaniesController < ApplicationController
  
  def new
    @company = Company.new
  end
  
  def create
    @company = Company.new(params[:company])
    @company.user_id = current_user.id

    if @company.save
      redirect_to clients_path, notice: 'Your company was successfully created.'
    else
      render :new
    end
  end
  
  def show
    @company = current_user.company
    if !@company
      redirect_to new_user_company_path(current_user)
    end   
  end
  
  def edit
    @company = current_user.company
  end
  
  def update
    @company = current_user.company
    if @company.update_attributes(params[:company])
      redirect_to @company, notice: 'Settings were successfully updated.'
    else
      render :edit
    end   
  end
    
end