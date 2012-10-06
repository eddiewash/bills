require 'test_helper'

class ClientsControllerTest < ActionController::TestCase
  setup do
    @client = clients(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:clients)
  end

  test "should be redirected when not logged in" do
    get :new
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end
  
  test "should render the new page when logged in" do
    sign_in users(:steve)
    get :new
    assert_response :success
  end
  
  test "should be signed in to add a client" do
    post :create, client: { client_name: "XYZ Co."}
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end

  test "should create client when logged in" do
    sign_in users(:steve)
    assert_difference('Client.count') do
      post :create, client: { address1: @client.address1, address2: @client.address2, city: @client.city, client_name: @client.client_name, notes: @client.notes, state: @client.state }
    end

    assert_redirected_to client_path(assigns(:client))
  end

  test "should be signed in to show a client" do
    get :show, id: @client
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end
  
  test "should show client when signed in" do
    sign_in users(:steve)
    get :show, id: @client
    assert_response :success
  end
  
  test "should be signed in to edit a client" do
    get :edit, id: @client
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end

  test "should get edit when signed in" do
    sign_in users(:steve)
    get :edit, id: @client
    assert_response :success
  end

  test "should update client" do
    put :update, id: @client, client: { address1: @client.address1, address2: @client.address2, city: @client.city, client_name: @client.client_name, notes: @client.notes, state: @client.state }
    assert_redirected_to client_path(assigns(:client))
  end

  test "should destroy client" do
    assert_difference('Client.count', -1) do
      delete :destroy, id: @client
    end

    assert_redirected_to clients_path
  end
end
