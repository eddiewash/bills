class ApplicationController < ActionController::Base
  protect_from_forgery
  
  private

  def after_sign_out_path_for(resource_or_scope)
    signin_path
  end
  
  def after_sign_in_path_for(resource_or_scope)
    main_path
  end
  
end
