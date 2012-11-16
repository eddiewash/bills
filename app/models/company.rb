# == Schema Information
#
# Table name: companies
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  phone       :string(255)
#  email       :string(255)
#  logo        :string(255)
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  payment_due :integer
#  address     :text
#

class Company < ActiveRecord::Base
  attr_accessible :name, :phone, :email, :address, :logo, :remote_logo_url, :remove_logo, :payment_due
  
  belongs_to :user
  
  mount_uploader :logo, ImageUploader
  
end
