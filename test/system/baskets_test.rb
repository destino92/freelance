require "application_system_test_case"

class BasketsTest < ApplicationSystemTestCase
  setup do
    @basket = baskets(:one)
  end

  test "visiting the index" do
    visit baskets_url
    assert_selector "h1", text: "Baskets"
  end

  test "creating a Basket" do
    visit baskets_url
    click_on "New Basket"

    click_on "Create Basket"

    assert_text "Basket was successfully created"
    click_on "Back"
  end

  test "updating a Basket" do
    visit baskets_url
    click_on "Edit", match: :first

    click_on "Update Basket"

    assert_text "Basket was successfully updated"
    click_on "Back"
  end

  test "destroying a Basket" do
    visit baskets_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Basket was successfully destroyed"
  end
end
