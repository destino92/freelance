require 'test_helper'

class NegotiationOffersControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get negotiation_offers_create_url
    assert_response :success
  end

end
