# frozen_string_literal: true

require 'application_system_test_case'

class TransactionsTest < ApplicationSystemTestCase
  setup { @transaction = transactions(:one) }

  test 'visiting the index' do
    visit transactions_url
    assert_selector 'h1', text: 'Transactions'
  end

  test 'creating a Transaction' do
    visit transactions_url
    click_on 'New Transaction'

    fill_in 'Invoice number', with: @transaction.invoice_number
    fill_in 'Postal carrier', with: @transaction.postal_carrier
    check 'Shipped' if @transaction.shipped
    fill_in 'Tracking number', with: @transaction.tracking_number
    fill_in 'Transaction msg', with: @transaction.transaction_msg
    fill_in 'User', with: @transaction.user_id
    click_on 'Create Transaction'

    assert_text 'Transaction was successfully created'
    click_on 'Back'
  end

  test 'updating a Transaction' do
    visit transactions_url
    click_on 'Edit', match: :first

    fill_in 'Invoice number', with: @transaction.invoice_number
    fill_in 'Postal carrier', with: @transaction.postal_carrier
    check 'Shipped' if @transaction.shipped
    fill_in 'Tracking number', with: @transaction.tracking_number
    fill_in 'Transaction msg', with: @transaction.transaction_msg
    fill_in 'User', with: @transaction.user_id
    click_on 'Update Transaction'

    assert_text 'Transaction was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Transaction' do
    visit transactions_url
    page.accept_confirm { click_on 'Destroy', match: :first }

    assert_text 'Transaction was successfully destroyed'
  end
end
