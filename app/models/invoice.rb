class Invoice < ActiveRecord::Base
  attr_accessible :job_name, :notes, :service_date, :client_id
  
  belongs_to :client
end
