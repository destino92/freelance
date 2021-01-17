require 'test_helper'

class NegotiationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get negotiations_index_url
    assert_response :success
  end

  test "should get create" do
    get negotiations_create_url
    assert_response :success
  end

end
