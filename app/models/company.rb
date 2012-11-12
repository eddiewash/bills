# == Schema Information
#
# Table name: companies
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  phone      :string(255)
#  email      :string(255)
#  address1   :string(255)
#  address2   :string(255)
#  city       :string(255)
#  state      :string(255)
#  zip        :string(255)
#  logo       :string(255)
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Company < ActiveRecord::Base
  attr_accessible :name, :phone, :email, :address1, :address2, :city, :state, :zip, :logo, :remote_logo_url, :remove_logo
  
  belongs_to :user
  
  mount_uploader :logo, ImageUploader
  
end
