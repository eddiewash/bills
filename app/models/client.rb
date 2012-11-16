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
#  email       :string(255)
#  phone       :string(255)
#  poc         :string(255)
#  address     :text
#

class Client < ActiveRecord::Base
  attr_accessible :user_id, :address, :client_name, :poc, :notes, :phone, :email
  belongs_to :user
  has_many :invoices, :dependent => :destroy
  
  validates :client_name, presence: true
  
  validates :user_id, presence: true
  
end
