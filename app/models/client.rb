class Client < ActiveRecord::Base
  attr_accessible :user_id, :address1, :address2, :city, :client_name, :notes, :state
  belongs_to :user
  has_many :invoices
  
  validates :client_name, presence: true
  
  validates :user_id, presence: true
  
end
