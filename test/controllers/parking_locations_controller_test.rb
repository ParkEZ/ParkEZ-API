require 'test_helper'

class ParkingLocatonsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @parking_locaton = parking_locatons(:one)
  end

  test 'should get index' do
    get parking_locatons_url
    assert_response :success
  end

  test 'should create parking_locaton' do
    assert_difference('ParkingLocaton.count') do
      post parking_locatons_url, params: { parking_locaton: { lat: @parking_locaton.lat, long: @parking_locaton.long, status: @parking_locaton.status } }
    end

    assert_response 201
  end

  test 'should show parking_locaton' do
    get parking_locaton_url(@parking_locaton)
    assert_response :success
  end

  test 'should update parking_locaton' do
    patch parking_locaton_url(@parking_locaton), params: { parking_locaton: { lat: @parking_locaton.lat, long: @parking_locaton.long, status: @parking_locaton.status } }
    assert_response 200
  end

  test 'should destroy parking_locaton' do
    assert_difference('ParkingLocaton.count', -1) do
      delete parking_locaton_url(@parking_locaton)
    end

    assert_response 204
  end
end
