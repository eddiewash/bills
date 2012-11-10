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
  
  
  
  
  
  
end