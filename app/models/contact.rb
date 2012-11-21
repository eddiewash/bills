# == Schema Information
#
# Table name: contacts
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  phone_work :string(255)
#  phone_cell :string(255)
#  notes      :text
#  client_id  :integer
#

class Contact < ActiveRecord::Base
  attr_accessible :client_id, :name, :notes, :phone_cell, :phone_work, :email
  
  belongs_to :client
  
  validates :name, presence: true
  
  validates :client_id, presence: true
  
end
