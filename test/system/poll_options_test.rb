require "application_system_test_case"

class PollOptionsTest < ApplicationSystemTestCase
  setup do
    @poll_option = poll_options(:one)
  end

  test "visiting the index" do
    visit poll_options_url
    assert_selector "h1", text: "Poll Options"
  end

  test "creating a Poll option" do
    visit poll_options_url
    click_on "New Poll Option"

    fill_in "Count", with: @poll_option.count
    check "Enabled" if @poll_option.enabled
    fill_in "Item", with: @poll_option.item
    fill_in "Poll", with: @poll_option.poll
    fill_in "Poll url", with: @poll_option.poll_url
    check "Poll url enabled" if @poll_option.poll_url_enabled
    click_on "Create Poll option"

    assert_text "Poll option was successfully created"
    click_on "Back"
  end

  test "updating a Poll option" do
    visit poll_options_url
    click_on "Edit", match: :first

    fill_in "Count", with: @poll_option.count
    check "Enabled" if @poll_option.enabled
    fill_in "Item", with: @poll_option.item
    fill_in "Poll", with: @poll_option.poll
    fill_in "Poll url", with: @poll_option.poll_url
    check "Poll url enabled" if @poll_option.poll_url_enabled
    click_on "Update Poll option"

    assert_text "Poll option was successfully updated"
    click_on "Back"
  end

  test "destroying a Poll option" do
    visit poll_options_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Poll option was successfully destroyed"
  end
end
