class EmailRecipient < ActiveRecord::Base
  attr_accessible :contact_id, :email_id
  
  belongs_to :email

  
   
end