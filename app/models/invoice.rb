# == Schema Information
#
# Table name: invoices
#
#  id           :integer          not null, primary key
#  job_name     :string(255)
#  notes        :text
#  service_date :date
#  client_id    :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Invoice < ActiveRecord::Base
  attr_accessible :job_name, :notes, :service_date, :client_id, :items_attributes
  
  belongs_to :client
  has_many :items
  accepts_nested_attributes_for :items, allow_destroy: true
  
  validates :job_name, presence: true
  validates :service_date, presence: true
  
end
