# frozen_string_literal: true

require 'application_system_test_case'

class NotificationsTest < ApplicationSystemTestCase
  setup { @notification = notifications(:one) }

  test 'visiting the index' do
    visit notifications_url
    assert_selector 'h1', text: 'Notifications'
  end

  test 'creating a Notification' do
    visit notifications_url
    click_on 'New Notification'

    check 'Enabled' if @notification.enabled
    fill_in 'Notify msg', with: @notification.notify_msg
    fill_in 'User', with: @notification.user_id
    click_on 'Create Notification'

    assert_text 'Notification was successfully created'
    click_on 'Back'
  end

  test 'updating a Notification' do
    visit notifications_url
    click_on 'Edit', match: :first

    check 'Enabled' if @notification.enabled
    fill_in 'Notify msg', with: @notification.notify_msg
    fill_in 'User', with: @notification.user_id
    click_on 'Update Notification'

    assert_text 'Notification was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Notification' do
    visit notifications_url
    page.accept_confirm { click_on 'Destroy', match: :first }

    assert_text 'Notification was successfully destroyed'
  end
end
