class Client < ActiveRecord::Base
  attr_accessible :address1, :address2, :city, :client_name, :notes, :state
end
