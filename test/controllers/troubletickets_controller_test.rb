# frozen_string_literal: true

require 'test_helper'

class TroubleticketsControllerTest < ActionDispatch::IntegrationTest
  setup { @troubleticket = troubletickets(:one) }

  test 'should get index' do
    get troubletickets_url
    assert_response :success
  end

  test 'should get new' do
    get new_troubleticket_url
    assert_response :success
  end

  test 'should create troubleticket' do
    assert_difference('Troubleticket.count') do
      post troubletickets_url,
           params: {
             troubleticket: {
               campaign: @troubleticket.campaign,
               message: @troubleticket.message,
               status: @troubleticket.status,
               subject: @troubleticket.subject,
               user_id: @troubleticket.user_id
             }
           }
    end

    assert_redirected_to troubleticket_url(Troubleticket.last)
  end

  test 'should show troubleticket' do
    get troubleticket_url(@troubleticket)
    assert_response :success
  end

  test 'should get edit' do
    get edit_troubleticket_url(@troubleticket)
    assert_response :success
  end

  test 'should update troubleticket' do
    patch troubleticket_url(@troubleticket),
          params: {
            troubleticket: {
              campaign: @troubleticket.campaign,
              message: @troubleticket.message,
              status: @troubleticket.status,
              subject: @troubleticket.subject,
              user_id: @troubleticket.user_id
            }
          }
    assert_redirected_to troubleticket_url(@troubleticket)
  end

  test 'should destroy troubleticket' do
    assert_difference('Troubleticket.count', -1) do
      delete troubleticket_url(@troubleticket)
    end

    assert_redirected_to troubletickets_url
  end
end
