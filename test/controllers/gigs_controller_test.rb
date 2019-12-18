require 'test_helper'

class GigsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get gigs_new_url
    assert_response :success
  end

  test "should get create" do
    get gigs_create_url
    assert_response :success
  end

  test "should get edit" do
    get gigs_edit_url
    assert_response :success
  end

  test "should get update" do
    get gigs_update_url
    assert_response :success
  end

  test "should get show" do
    get gigs_show_url
    assert_response :success
  end

  test "should get no-test-framework" do
    get gigs_no-test-framework_url
    assert_response :success
  end

end
