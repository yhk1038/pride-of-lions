require 'test_helper'

class UserMsgControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get send_" do
    get :send_
    assert_response :success
  end

  test "should get read_" do
    get :read_
    assert_response :success
  end

  test "should get write_" do
    get :write_
    assert_response :success
  end

end
