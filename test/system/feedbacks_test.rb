# frozen_string_literal: true

require 'application_system_test_case'

class FeedbacksTest < ApplicationSystemTestCase
  setup { @feedback = feedbacks(:one) }

  test 'visiting the index' do
    visit feedbacks_url
    assert_selector 'h1', text: 'Feedbacks'
  end

  test 'creating a Feedback' do
    visit feedbacks_url
    click_on 'New Feedback'

    fill_in 'Category', with: @feedback.category_id
    fill_in 'Comment', with: @feedback.comment
    fill_in 'Rate', with: @feedback.rate
    fill_in 'Recommned', with: @feedback.recommned
    click_on 'Create Feedback'

    assert_text 'Feedback was successfully created'
    click_on 'Back'
  end

  test 'updating a Feedback' do
    visit feedbacks_url
    click_on 'Edit', match: :first

    fill_in 'Category', with: @feedback.category_id
    fill_in 'Comment', with: @feedback.comment
    fill_in 'Rate', with: @feedback.rate
    fill_in 'Recommned', with: @feedback.recommned
    click_on 'Update Feedback'

    assert_text 'Feedback was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Feedback' do
    visit feedbacks_url
    page.accept_confirm { click_on 'Destroy', match: :first }

    assert_text 'Feedback was successfully destroyed'
  end
end
