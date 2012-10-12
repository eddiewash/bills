class Item < ActiveRecord::Base
  attr_accessible :name, :invoice_id, :quantity, :cost_per
  
  belongs_to :invoice
  
  validates :name, :quantity, :cost_per, :invoice_id, presence: true
  

  
end