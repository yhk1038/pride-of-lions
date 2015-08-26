require 'test_helper'

class BoardControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get write" do
    get :write
    assert_response :success
  end

  test "should get writing" do
    get :writing
    assert_response :success
  end

  test "should get read" do
    get :read
    assert_response :success
  end

  test "should get comment" do
    get :comment
    assert_response :success
  end

  test "should get modify" do
    get :modify
    assert_response :success
  end

  test "should get delete" do
    get :delete
    assert_response :success
  end

end
