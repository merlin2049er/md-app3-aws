require "application_system_test_case"

class WarehousesTest < ApplicationSystemTestCase
  setup do
    @warehouse = warehouses(:one)
  end

  test "visiting the index" do
    visit warehouses_url
    assert_selector "h1", text: "Warehouses"
  end

  test "creating a Warehouse" do
    visit warehouses_url
    click_on "New Warehouse"

    fill_in "Address1", with: @warehouse.address1
    fill_in "Address2", with: @warehouse.address2
    fill_in "City", with: @warehouse.city
    fill_in "Name", with: @warehouse.name
    fill_in "Postalcode", with: @warehouse.postalcode
    fill_in "Prov", with: @warehouse.prov
    click_on "Create Warehouse"

    assert_text "Warehouse was successfully created"
    click_on "Back"
  end

  test "updating a Warehouse" do
    visit warehouses_url
    click_on "Edit", match: :first

    fill_in "Address1", with: @warehouse.address1
    fill_in "Address2", with: @warehouse.address2
    fill_in "City", with: @warehouse.city
    fill_in "Name", with: @warehouse.name
    fill_in "Postalcode", with: @warehouse.postalcode
    fill_in "Prov", with: @warehouse.prov
    click_on "Update Warehouse"

    assert_text "Warehouse was successfully updated"
    click_on "Back"
  end

  test "destroying a Warehouse" do
    visit warehouses_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Warehouse was successfully destroyed"
  end
end
