require 'test_helper'

class RegisterEmployerControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get register_employer_create_url
    assert_response :success
  end

  test "should get update" do
    get register_employer_update_url
    assert_response :success
  end

end
