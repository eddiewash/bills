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
#

class Item < ActiveRecord::Base
  attr_accessible :name, :invoice_id, :quantity, :cost_per
  
  belongs_to :invoice
  
  validates :name, :quantity, :cost_per, :invoice_id, presence: true
  

  
end
