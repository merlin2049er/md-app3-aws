# frozen_string_literal: true

require 'application_system_test_case'

class FaqsTest < ApplicationSystemTestCase
  setup { @faq = faqs(:one) }

  test 'visiting the index' do
    visit faqs_url
    assert_selector 'h1', text: 'Faqs'
  end

  test 'creating a Faq' do
    visit faqs_url
    click_on 'New Faq'

    fill_in 'Answer', with: @faq.answer
    fill_in 'Question', with: @faq.question
    click_on 'Create Faq'

    assert_text 'Faq was successfully created'
    click_on 'Back'
  end

  test 'updating a Faq' do
    visit faqs_url
    click_on 'Edit', match: :first

    fill_in 'Answer', with: @faq.answer
    fill_in 'Question', with: @faq.question
    click_on 'Update Faq'

    assert_text 'Faq was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Faq' do
    visit faqs_url
    page.accept_confirm { click_on 'Destroy', match: :first }

    assert_text 'Faq was successfully destroyed'
  end
end
