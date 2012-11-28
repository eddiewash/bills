# == Schema Information
#
# Table name: invoices
#
#  id             :integer          not null, primary key
#  job_name       :string(255)
#  notes          :text
#  service_date   :date
#  client_id      :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  total          :decimal(, )
#  tax1           :decimal(, )
#  tax2           :decimal(, )
#  subtotal       :decimal(, )
#  total_tax1     :decimal(, )
#  total_tax2     :decimal(, )
#  po_number      :string(255)
#  invoice_date   :date
#  due_date       :date
#  balance        :decimal(, )
#  total_payments :decimal(, )
#  payment_terms  :integer
#

class Invoice < ActiveRecord::Base
  attr_accessible :items_attributes, :job_name, :po_number, :total_payments, :notes, :service_date, :due_date, :invoice_date, :client_id,  :tax1, :tax2, :payment_terms
  
  before_save :calculate_totals
  
  belongs_to :client
  has_one :user, :through => :client
  has_many :billings, :dependent => :destroy
  has_many :payments, :dependent => :destroy
  has_many :contacts, :through => :client
  has_many :items, :dependent => :destroy
  has_one :company, :through => :user
  has_many :emails, :dependent => :destroy
  accepts_nested_attributes_for :items, allow_destroy: true
  
  validates :job_name, :payment_terms, presence: true
  validates :service_date, presence: true
  validates :tax1, :tax2, :numericality => {:greater_than_or_equal_to => 0, :less_than => 15}, :allow_blank => true
  
  private
  
  def calculate_totals
    self.subtotal = 0
    self.total_tax1 = 0
    self.total_tax2 = 0
    
    self.items.each do |i|
      unless i.marked_for_destruction?
        self.subtotal += i.quantity * i.cost_per
        if i.tax1?
          self.total_tax1 += (i.quantity * i.cost_per)*(self.tax1/100)
        end
        if i.tax2?
          self.total_tax2 += (i.quantity * i.cost_per)*(self.tax2/100)
        end
      end
    end
    
    self.total = self.subtotal + self.total_tax1 + self.total_tax2
    
    if self.total_payments?
      self.balance = self.total - self.total_payments
    else
      self.balance = self.total
    end
     
  end
  
end
