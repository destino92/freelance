require 'test_helper'

class BasketItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @basket_item = basket_items(:one)
  end

  test "should get index" do
    get basket_items_url
    assert_response :success
  end

  test "should get new" do
    get new_basket_item_url
    assert_response :success
  end

  test "should create basket_item" do
    assert_difference('BasketItem.count') do
      post basket_items_url, params: { basket_item: { basket_id: @basket_item.basket_id, gig_id: @basket_item.gig_id } }
    end

    assert_redirected_to basket_item_url(BasketItem.last)
  end

  test "should show basket_item" do
    get basket_item_url(@basket_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_basket_item_url(@basket_item)
    assert_response :success
  end

  test "should update basket_item" do
    patch basket_item_url(@basket_item), params: { basket_item: { basket_id: @basket_item.basket_id, gig_id: @basket_item.gig_id } }
    assert_redirected_to basket_item_url(@basket_item)
  end

  test "should destroy basket_item" do
    assert_difference('BasketItem.count', -1) do
      delete basket_item_url(@basket_item)
    end

    assert_redirected_to basket_items_url
  end
end
