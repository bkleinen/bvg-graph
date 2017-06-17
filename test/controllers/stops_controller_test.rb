require 'test_helper'

class StopsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @stop = stops(:one)
  end

  test "should get index" do
    get stops_url
    assert_response :success
  end

  test "should get new" do
    get new_stop_url
    assert_response :success
  end

  test "should create stop" do
    assert_difference('Stop.count') do
      post stops_url, params: { stop: { location_type: @stop.location_type, parent_station: @stop.parent_station, stop_code: @stop.stop_code, stop_desc: @stop.stop_desc, stop_identifier: @stop.stop_identifier, stop_lat: @stop.stop_lat, stop_lon: @stop.stop_lon, stop_name: @stop.stop_name } }
    end

    assert_redirected_to stop_url(Stop.last)
  end

  test "should show stop" do
    get stop_url(@stop)
    assert_response :success
  end

  test "should get edit" do
    get edit_stop_url(@stop)
    assert_response :success
  end

  test "should update stop" do
    patch stop_url(@stop), params: { stop: { location_type: @stop.location_type, parent_station: @stop.parent_station, stop_code: @stop.stop_code, stop_desc: @stop.stop_desc, stop_identifier: @stop.stop_identifier, stop_lat: @stop.stop_lat, stop_lon: @stop.stop_lon, stop_name: @stop.stop_name } }
    assert_redirected_to stop_url(@stop)
  end

  test "should destroy stop" do
    assert_difference('Stop.count', -1) do
      delete stop_url(@stop)
    end

    assert_redirected_to stops_url
  end
end
