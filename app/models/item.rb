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
#  tax1       :boolean          default(FALSE)
#  tax2       :boolean          default(FALSE)
#

class Item < ActiveRecord::Base
  attr_accessible :name, :invoice_id, :quantity, :cost_per, :total_cost, :tax1, :tax2
  
  belongs_to :invoice
  
  before_save :calculate_total_price
  
  validates :name, presence: true
  validates :quantity, :numericality => { :only_integer => true }
  validates :cost_per, :format => { :with => /^\d+??(?:\.\d{0,2})?$/ }, :numericality => {:greater_than_or_equal_to => 0, :less_than => 100000}
  
  private
  
  def calculate_total_price
    self.total_cost = self.quantity * self.cost_per 
  end
    
  
end
