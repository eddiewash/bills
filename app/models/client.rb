# == Schema Information
#
# Table name: clients
#
#  id          :integer          not null, primary key
#  client_name :string(255)
#  notes       :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#  address     :text
#

class Client < ActiveRecord::Base
  attr_accessible :user_id, :address, :client_name, :notes
  belongs_to :user
  has_many :invoices, :dependent => :destroy
  has_many :contacts, :dependent => :destroy
  
  validates :client_name, presence: true
  
  validates :user_id, presence: true
  
end
