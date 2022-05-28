# frozen_string_literal: true

require 'application_system_test_case'

class TroubleticketsTest < ApplicationSystemTestCase
  setup { @troubleticket = troubletickets(:one) }

  test 'visiting the index' do
    visit troubletickets_url
    assert_selector 'h1', text: 'Troubletickets'
  end

  test 'creating a Troubleticket' do
    visit troubletickets_url
    click_on 'New Troubleticket'

    fill_in 'Campaign', with: @troubleticket.campaign
    fill_in 'Message', with: @troubleticket.message
    check 'Status' if @troubleticket.status
    fill_in 'Subject', with: @troubleticket.subject
    fill_in 'User', with: @troubleticket.user_id
    click_on 'Create Troubleticket'

    assert_text 'Troubleticket was successfully created'
    click_on 'Back'
  end

  test 'updating a Troubleticket' do
    visit troubletickets_url
    click_on 'Edit', match: :first

    fill_in 'Campaign', with: @troubleticket.campaign
    fill_in 'Message', with: @troubleticket.message
    check 'Status' if @troubleticket.status
    fill_in 'Subject', with: @troubleticket.subject
    fill_in 'User', with: @troubleticket.user_id
    click_on 'Update Troubleticket'

    assert_text 'Troubleticket was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Troubleticket' do
    visit troubletickets_url
    page.accept_confirm { click_on 'Destroy', match: :first }

    assert_text 'Troubleticket was successfully destroyed'
  end
end
