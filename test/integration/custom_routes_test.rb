require 'test_helper'

class CustomRoutesTest < ActionDispatch::IntegrationTest

  test "that the /signin route opens the sign in page" do
    get '/signin'
    assert_response :success
  end
  
  test "that the /logout route opens the logout page" do
    get '/logout'
    assert_response :redirect
    assert_redirected_to '/'
  end
  
  test "that the /register route opens the register page" do
    get '/register'
    assert_response :success
  end
  
end
