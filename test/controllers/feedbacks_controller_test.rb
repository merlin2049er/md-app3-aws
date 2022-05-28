# frozen_string_literal: true

require 'test_helper'

class FeedbacksControllerTest < ActionDispatch::IntegrationTest
  setup { @feedback = feedbacks(:one) }

  test 'should get index' do
    get feedbacks_url
    assert_response :success
  end

  test 'should get new' do
    get new_feedback_url
    assert_response :success
  end

  test 'should create feedback' do
    assert_difference('Feedback.count') do
      post feedbacks_url,
           params: {
             feedback: {
               category_id: @feedback.category_id,
               comment: @feedback.comment,
               rate: @feedback.rate,
               recommned: @feedback.recommned
             }
           }
    end

    assert_redirected_to feedback_url(Feedback.last)
  end

  test 'should show feedback' do
    get feedback_url(@feedback)
    assert_response :success
  end

  test 'should get edit' do
    get edit_feedback_url(@feedback)
    assert_response :success
  end

  test 'should update feedback' do
    patch feedback_url(@feedback),
          params: {
            feedback: {
              category_id: @feedback.category_id,
              comment: @feedback.comment,
              rate: @feedback.rate,
              recommned: @feedback.recommned
            }
          }
    assert_redirected_to feedback_url(@feedback)
  end

  test 'should destroy feedback' do
    assert_difference('Feedback.count', -1) { delete feedback_url(@feedback) }

    assert_redirected_to feedbacks_url
  end
end
