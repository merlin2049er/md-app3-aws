require "application_system_test_case"

class VendorsTest < ApplicationSystemTestCase
  setup do
    @vendor = vendors(:one)
  end

  test "visiting the index" do
    visit vendors_url
    assert_selector "h1", text: "Vendors"
  end

  test "creating a Vendor" do
    visit vendors_url
    click_on "New Vendor"

    fill_in "Address1", with: @vendor.address1
    fill_in "Address2", with: @vendor.address2
    fill_in "Contact name", with: @vendor.contact_name
    check "Dropship" if @vendor.dropship
    check "Locally" if @vendor.locally
    fill_in "Payments", with: @vendor.payments
    fill_in "Processing", with: @vendor.processing
    fill_in "Product", with: @vendor.product
    fill_in "Vendor", with: @vendor.vendor
    fill_in "Website", with: @vendor.website
    click_on "Create Vendor"

    assert_text "Vendor was successfully created"
    click_on "Back"
  end

  test "updating a Vendor" do
    visit vendors_url
    click_on "Edit", match: :first

    fill_in "Address1", with: @vendor.address1
    fill_in "Address2", with: @vendor.address2
    fill_in "Contact name", with: @vendor.contact_name
    check "Dropship" if @vendor.dropship
    check "Locally" if @vendor.locally
    fill_in "Payments", with: @vendor.payments
    fill_in "Processing", with: @vendor.processing
    fill_in "Product", with: @vendor.product
    fill_in "Vendor", with: @vendor.vendor
    fill_in "Website", with: @vendor.website
    click_on "Update Vendor"

    assert_text "Vendor was successfully updated"
    click_on "Back"
  end

  test "destroying a Vendor" do
    visit vendors_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Vendor was successfully destroyed"
  end
end
