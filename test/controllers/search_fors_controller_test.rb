require 'test_helper'

class SearchForsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @search_for = search_fors(:one)
  end

  test "should get index" do
    get search_fors_url
    assert_response :success
  end

  test "should get new" do
    get new_search_for_url
    assert_response :success
  end

  test "should create search_for" do
    assert_difference('SearchFor.count') do
      post search_fors_url, params: { search_for: { searchterm: @search_for.searchterm } }
    end

    assert_redirected_to search_for_url(SearchFor.last)
  end

  test "should show search_for" do
    get search_for_url(@search_for)
    assert_response :success
  end

  test "should get edit" do
    get edit_search_for_url(@search_for)
    assert_response :success
  end

  test "should update search_for" do
    patch search_for_url(@search_for), params: { search_for: { searchterm: @search_for.searchterm } }
    assert_redirected_to search_for_url(@search_for)
  end

  test "should destroy search_for" do
    assert_difference('SearchFor.count', -1) do
      delete search_for_url(@search_for)
    end

    assert_redirected_to search_fors_url
  end
end
