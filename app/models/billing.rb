# == Schema Information
#
# Table name: billings
#
#  id         :integer          not null, primary key
#  invoice_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Billing < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :invoice_id
  belongs_to :invoice
end
