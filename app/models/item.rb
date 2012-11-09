# == Schema Information
#
# Table name: items
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  quantity   :integer
#  cost_per   :decimal(, )
#  invoice_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  total_cost :decimal(, )
#

class Item < ActiveRecord::Base
  attr_accessible :name, :invoice_id, :quantity, :cost_per, :total_cost
  
  belongs_to :invoice
  
  before_save :calculate_total_price
  
  private
  
  def calculate_total_price
    self.total_cost = self.quantity * self.cost_per 
  end
    
  
end
