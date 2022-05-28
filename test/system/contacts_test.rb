# frozen_string_literal: true

require 'application_system_test_case'

class ContactsTest < ApplicationSystemTestCase
  setup { @contact = contacts(:one) }

  test 'visiting the index' do
    visit contacts_url
    assert_selector 'h1', text: 'Contacts'
  end

  test 'creating a Contact' do
    visit contacts_url
    click_on 'New Contact'

    fill_in 'Email', with: @contact.email
    fill_in 'Message', with: @contact.message
    fill_in 'Name', with: @contact.name
    check 'Registered user' if @contact.registered_user
    check 'Supplier' if @contact.supplier
    click_on 'Create Contact'

    assert_text 'Contact was successfully created'
    click_on 'Back'
  end

  test 'updating a Contact' do
    visit contacts_url
    click_on 'Edit', match: :first

    fill_in 'Email', with: @contact.email
    fill_in 'Message', with: @contact.message
    fill_in 'Name', with: @contact.name
    check 'Registered user' if @contact.registered_user
    check 'Supplier' if @contact.supplier
    click_on 'Update Contact'

    assert_text 'Contact was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Contact' do
    visit contacts_url
    page.accept_confirm { click_on 'Destroy', match: :first }

    assert_text 'Contact was successfully destroyed'
  end
end
