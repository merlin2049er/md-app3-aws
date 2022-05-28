# frozen_string_literal: true

require 'application_system_test_case'

class PhotosTest < ApplicationSystemTestCase
  setup { @photo = photos(:one) }

  test 'visiting the index' do
    visit photos_url
    assert_selector 'h1', text: 'Photos'
  end

  test 'creating a Photo' do
    visit photos_url
    click_on 'New Photo'

    check 'Enabled' if @photo.enabled
    fill_in 'Product', with: @photo.product_id
    fill_in 'Uri', with: @photo.uri
    click_on 'Create Photo'

    assert_text 'Photo was successfully created'
    click_on 'Back'
  end

  test 'updating a Photo' do
    visit photos_url
    click_on 'Edit', match: :first

    check 'Enabled' if @photo.enabled
    fill_in 'Product', with: @photo.product_id
    fill_in 'Uri', with: @photo.uri
    click_on 'Update Photo'

    assert_text 'Photo was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Photo' do
    visit photos_url
    page.accept_confirm { click_on 'Destroy', match: :first }

    assert_text 'Photo was successfully destroyed'
  end
end
