require 'test_helper'

class PollOptionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @poll_option = poll_options(:one)
  end

  test "should get index" do
    get poll_options_url
    assert_response :success
  end

  test "should get new" do
    get new_poll_option_url
    assert_response :success
  end

  test "should create poll_option" do
    assert_difference('PollOption.count') do
      post poll_options_url, params: { poll_option: { count: @poll_option.count, enabled: @poll_option.enabled, item: @poll_option.item, poll: @poll_option.poll, poll_url: @poll_option.poll_url, poll_url_enabled: @poll_option.poll_url_enabled } }
    end

    assert_redirected_to poll_option_url(PollOption.last)
  end

  test "should show poll_option" do
    get poll_option_url(@poll_option)
    assert_response :success
  end

  test "should get edit" do
    get edit_poll_option_url(@poll_option)
    assert_response :success
  end

  test "should update poll_option" do
    patch poll_option_url(@poll_option), params: { poll_option: { count: @poll_option.count, enabled: @poll_option.enabled, item: @poll_option.item, poll: @poll_option.poll, poll_url: @poll_option.poll_url, poll_url_enabled: @poll_option.poll_url_enabled } }
    assert_redirected_to poll_option_url(@poll_option)
  end

  test "should destroy poll_option" do
    assert_difference('PollOption.count', -1) do
      delete poll_option_url(@poll_option)
    end

    assert_redirected_to poll_options_url
  end
end
