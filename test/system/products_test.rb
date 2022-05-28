# frozen_string_literal: true

require 'application_system_test_case'

class ProductsTest < ApplicationSystemTestCase
  setup { @product = products(:one) }

  test 'visiting the index' do
    visit products_url
    assert_selector 'h1', text: 'Products'
  end

  test 'creating a Product' do
    visit products_url
    click_on 'New Product'

    check 'Active' if @product.active
    fill_in 'Courier', with: @product.courier
    fill_in 'Courierurl', with: @product.courierurl
    check 'Draft' if @product.draft
    fill_in 'Endate', with: @product.endate
    check 'Funded' if @product.funded
    fill_in 'Height', with: @product.height
    fill_in 'Length', with: @product.length
    fill_in 'Msrp', with: @product.msrp
    fill_in 'Picurl', with: @product.picurl
    fill_in 'Price', with: @product.price
    fill_in 'Qty', with: @product.qty
    fill_in 'Startdate', with: @product.startdate
    fill_in 'Template', with: @product.template
    fill_in 'Title', with: @product.title
    fill_in 'Weight', with: @product.weight
    fill_in 'Width', with: @product.width
    click_on 'Create Product'

    assert_text 'Product was successfully created'
    click_on 'Back'
  end

  test 'updating a Product' do
    visit products_url
    click_on 'Edit', match: :first

    check 'Active' if @product.active
    fill_in 'Courier', with: @product.courier
    fill_in 'Courierurl', with: @product.courierurl
    check 'Draft' if @product.draft
    fill_in 'Endate', with: @product.endate
    check 'Funded' if @product.funded
    fill_in 'Height', with: @product.height
    fill_in 'Length', with: @product.length
    fill_in 'Msrp', with: @product.msrp
    fill_in 'Picurl', with: @product.picurl
    fill_in 'Price', with: @product.price
    fill_in 'Qty', with: @product.qty
    fill_in 'Startdate', with: @product.startdate
    fill_in 'Template', with: @product.template
    fill_in 'Title', with: @product.title
    fill_in 'Weight', with: @product.weight
    fill_in 'Width', with: @product.width
    click_on 'Update Product'

    assert_text 'Product was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Product' do
    visit products_url
    page.accept_confirm { click_on 'Destroy', match: :first }

    assert_text 'Product was successfully destroyed'
  end
end
