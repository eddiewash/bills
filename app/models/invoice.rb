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
#  subtotal     :decimal(, )
#  total_tax1   :decimal(, )
#  total_tax2   :decimal(, )
#

class Invoice < ActiveRecord::Base
  attr_accessible :items_attributes, :job_name, :notes, :service_date, :client_id,  :tax1, :tax2
  
  before_save :calculate_totals
  
  belongs_to :client
  has_one :user, :through => :client
  has_many :billings, :dependent => :destroy
  has_many :items, :dependent => :destroy
  has_one :company, :through => :user
  accepts_nested_attributes_for :items, allow_destroy: true
  
  validates :job_name, presence: true
  validates :service_date, presence: true
  validates :tax1, :tax2, :numericality => {:greater_than_or_equal_to => 0, :less_than => 15}, :allow_blank => true
  
  private
  
  def calculate_totals
    self.subtotal = 0
    self.total_tax1 = 0
    self.total_tax2 = 0
    
    self.items.each do |i|
      unless i.marked_for_destruction?
        self.subtotal = self.subtotal + (i.quantity * i.cost_per)
        if i.tax1?
          self.total_tax1 = self.total_tax1 + (i.quantity * i.cost_per)*(self.tax1/100)
        end
        if i.tax2?
          self.total_tax2 = self.total_tax2 + (i.quantity * i.cost_per)*(self.tax2/100)
        end
      end
    end
    
    self.total = self.subtotal + self.total_tax1 + self.total_tax2
    
    
  end
  
end
