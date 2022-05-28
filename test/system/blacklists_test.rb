# frozen_string_literal: true

require 'application_system_test_case'

class BlacklistsTest < ApplicationSystemTestCase
  setup { @blacklist = blacklists(:one) }

  test 'visiting the index' do
    visit blacklists_url
    assert_selector 'h1', text: 'Blacklists'
  end

  test 'creating a Blacklist' do
    visit blacklists_url
    click_on 'New Blacklist'

    fill_in 'Comment', with: @blacklist.comment
    fill_in 'Email', with: @blacklist.email
    click_on 'Create Blacklist'

    assert_text 'Blacklist was successfully created'
    click_on 'Back'
  end

  test 'updating a Blacklist' do
    visit blacklists_url
    click_on 'Edit', match: :first

    fill_in 'Comment', with: @blacklist.comment
    fill_in 'Email', with: @blacklist.email
    click_on 'Update Blacklist'

    assert_text 'Blacklist was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Blacklist' do
    visit blacklists_url
    page.accept_confirm { click_on 'Destroy', match: :first }

    assert_text 'Blacklist was successfully destroyed'
  end
end
