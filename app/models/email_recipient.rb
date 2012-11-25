# == Schema Information
#
# Table name: email_recipients
#
#  id         :integer          not null, primary key
#  email_id   :integer
#  contact_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class EmailRecipient < ActiveRecord::Base
  attr_accessible :contact_id, :email_id
  
  belongs_to :email

  
   
end
