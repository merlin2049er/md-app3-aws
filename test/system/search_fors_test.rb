require "application_system_test_case"

class SearchForsTest < ApplicationSystemTestCase
  setup do
    @search_for = search_fors(:one)
  end

  test "visiting the index" do
    visit search_fors_url
    assert_selector "h1", text: "Search Fors"
  end

  test "creating a Search for" do
    visit search_fors_url
    click_on "New Search For"

    fill_in "Searchterm", with: @search_for.searchterm
    click_on "Create Search for"

    assert_text "Search for was successfully created"
    click_on "Back"
  end

  test "updating a Search for" do
    visit search_fors_url
    click_on "Edit", match: :first

    fill_in "Searchterm", with: @search_for.searchterm
    click_on "Update Search for"

    assert_text "Search for was successfully updated"
    click_on "Back"
  end

  test "destroying a Search for" do
    visit search_fors_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Search for was successfully destroyed"
  end
end
