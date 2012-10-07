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
