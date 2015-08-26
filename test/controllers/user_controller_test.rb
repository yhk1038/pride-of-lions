require 'test_helper'

class UserControllerTest < ActionController::TestCase
  test "should get login" do
    get :login
    assert_response :success
  end

  test "should get logout" do
    get :logout
    assert_response :success
  end

  test "should get login_confirm" do
    get :login_confirm
    assert_response :success
  end

  test "should get join" do
    get :join
    assert_response :success
  end

  test "should get join_confirm" do
    get :join_confirm
    assert_response :success
  end

end
