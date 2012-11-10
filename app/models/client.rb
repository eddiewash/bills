# == Schema Information
#
# Table name: clients
#
#  id          :integer          not null, primary key
#  client_name :string(255)
#  address1    :string(255)
#  address2    :string(255)
#  city        :string(255)
#  state       :string(255)
#  notes       :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#  zip         :string(255)
#  email       :string(255)
#  phone       :string(255)
#  poc         :string(255)
#

class Client < ActiveRecord::Base
  attr_accessible :user_id, :address1, :address2, :city, :client_name, :notes, :state, :phone, :email, :zip
  belongs_to :user
  has_many :invoices, :dependent => :destroy
  
  validates :client_name, presence: true
  
  validates :user_id, presence: true
  
end
