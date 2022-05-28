# frozen_string_literal: true

require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test 'should get about' do
    get pages_about_url
    assert_response :success
  end

  test 'should get activity' do
    get pages_activity_url
    assert_response :success
  end

  test 'should get contact' do
    get pages_contact_url
    assert_response :success
  end

  test 'should get cookies' do
    get pages_cookies_url
    assert_response :success
  end

  test 'should get dashboard' do
    get pages_dashboard_url
    assert_response :success
  end

  test 'should get error' do
    get pages_error_url
    assert_response :success
  end

  test 'should get faq' do
    get pages_faq_url
    assert_response :success
  end

  test 'should get index' do
    get pages_index_url
    assert_response :success
  end

  test 'should get invitations' do
    get pages_invitations_url
    assert_response :success
  end

  test 'should get invite' do
    get pages_invite_url
    assert_response :success
  end

  test 'should get jobs' do
    get pages_jobs_url
    assert_response :success
  end

  test 'should get privacy' do
    get pages_privacy_url
    assert_response :success
  end

  test 'should get terms' do
    get pages_terms_url
    assert_response :success
  end
end
