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
#  total        :decimal(, )
#  tax1         :decimal(, )
#  tax2         :decimal(, )
#

class Invoice < ActiveRecord::Base
  attr_accessible :job_name, :notes, :service_date, :client_id, :items_attributes, :tax1, :tax2
  
  belongs_to :client
  has_one :user, :through => :client
  has_many :billings, :dependent => :destroy
  has_many :items, :dependent => :destroy
  has_one :company, :through => :user
  accepts_nested_attributes_for :items, allow_destroy: true
  
  validates :job_name, presence: true
  validates :service_date, presence: true
  validates :tax1, :tax2, :numericality => {:greater_than_or_equal_to => 0, :less_than => 15}, :allow_blank => true
  
end
