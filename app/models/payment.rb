# == Schema Information
#
# Table name: payments
#
#  id           :integer          not null, primary key
#  invoice_id   :integer
#  payment_date :date
#  amount       :decimal(, )
#  note         :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Payment < ActiveRecord::Base
  attr_accessible :amount, :note, :payment_date, :invoice_id
  
  belongs_to :invoice
  
  validates :amount, presence: true
  validates :amount, :numericality => {:less_than => 100000}    
  
end
