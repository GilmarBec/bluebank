require 'test_helper'

class ClientSessionControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get client_session_create_url
    assert_response :success
  end

  test "should get update" do
    get client_session_update_url
    assert_response :success
  end

  test "should get destroy" do
    get client_session_destroy_url
    assert_response :success
  end

end
