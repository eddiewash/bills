# == Schema Information
#
# Table name: emails
#
#  id         :integer          not null, primary key
#  invoice_id :integer
#  subject    :text
#  message    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Email < ActiveRecord::Base
  attr_accessible :subject, :message, :invoice_id, :email_recipients_attributes
  
  belongs_to :invoice
  has_many :email_recipients
    
  accepts_nested_attributes_for :email_recipients
   
end
