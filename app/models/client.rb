class Client < ActiveRecord::Base
  attr_accessible :user_id, :address1, :address2, :city, :client_name, :notes, :state
  belongs_to :user
  

end
