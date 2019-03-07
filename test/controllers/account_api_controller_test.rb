require 'test_helper'

class AccountApiControllerTest < ActionDispatch::IntegrationTest
  test "should get transaction" do
    get account_api_transaction_url
    assert_response :success
  end

  test "should get show" do
    get account_api_show_url
    assert_response :success
  end

end
