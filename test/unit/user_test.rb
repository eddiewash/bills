require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "a user needs to enter a first name" do
    user = User.new
    assert !user.save
    assert !user.errors[:first_name].empty?
  end
  
  test "a user needs to enter a last name" do
    user = User.new
    assert !user.save
    assert !user.errors[:last_name].empty?
  end
  
end
