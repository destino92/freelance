require "application_system_test_case"

class BasketItemsTest < ApplicationSystemTestCase
  setup do
    @basket_item = basket_items(:one)
  end

  test "visiting the index" do
    visit basket_items_url
    assert_selector "h1", text: "Basket Items"
  end

  test "creating a Basket item" do
    visit basket_items_url
    click_on "New Basket Item"

    fill_in "Basket", with: @basket_item.basket_id
    fill_in "Gig", with: @basket_item.gig_id
    click_on "Create Basket item"

    assert_text "Basket item was successfully created"
    click_on "Back"
  end

  test "updating a Basket item" do
    visit basket_items_url
    click_on "Edit", match: :first

    fill_in "Basket", with: @basket_item.basket_id
    fill_in "Gig", with: @basket_item.gig_id
    click_on "Update Basket item"

    assert_text "Basket item was successfully updated"
    click_on "Back"
  end

  test "destroying a Basket item" do
    visit basket_items_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Basket item was successfully destroyed"
  end
end
