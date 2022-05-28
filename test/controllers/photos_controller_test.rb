# frozen_string_literal: true

require 'test_helper'

class PhotosControllerTest < ActionDispatch::IntegrationTest
  setup { @photo = photos(:one) }

  test 'should get index' do
    get photos_url
    assert_response :success
  end

  test 'should get new' do
    get new_photo_url
    assert_response :success
  end

  test 'should create photo' do
    assert_difference('Photo.count') do
      post photos_url,
           params: {
             photo: {
               enabled: @photo.enabled,
               product_id: @photo.product_id,
               uri: @photo.uri
             }
           }
    end

    assert_redirected_to photo_url(Photo.last)
  end

  test 'should show photo' do
    get photo_url(@photo)
    assert_response :success
  end

  test 'should get edit' do
    get edit_photo_url(@photo)
    assert_response :success
  end

  test 'should update photo' do
    patch photo_url(@photo),
          params: {
            photo: {
              enabled: @photo.enabled,
              product_id: @photo.product_id,
              uri: @photo.uri
            }
          }
    assert_redirected_to photo_url(@photo)
  end

  test 'should destroy photo' do
    assert_difference('Photo.count', -1) { delete photo_url(@photo) }

    assert_redirected_to photos_url
  end
end
