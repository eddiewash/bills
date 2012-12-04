# == Schema Information
#
# Table name: clients
#
#  id          :integer          not null, primary key
#  client_name :string(255)
#  notes       :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#  address     :text
#  latitude    :float
#  longitude   :float
#

require 'test_helper'

class ClientTest < ActiveSupport::TestCase
  
  test "that a client requires a client name" do
    client = Client.new
    assert !client.save
    assert !client.errors[:client_name].empty?
  end
  
  test "that a client has a user id" do
    client = Client.new
    client.client_name = "XYZ Co."
    assert !client.save
    assert !client.errors[:user_id].empty?
  end
  
end
