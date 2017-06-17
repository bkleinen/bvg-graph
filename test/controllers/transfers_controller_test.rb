require 'test_helper'

class TransfersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @transfer = transfers(:one)
  end

  test "should get index" do
    get transfers_url
    assert_response :success
  end

  test "should get new" do
    get new_transfer_url
    assert_response :success
  end

  test "should create transfer" do
    assert_difference('Transfer.count') do
      post transfers_url, params: { transfer: { from_route_identifier: @transfer.from_route_identifier, from_stop_identifier: @transfer.from_stop_identifier, from_trip_identifier: @transfer.from_trip_identifier, min_transfer_time: @transfer.min_transfer_time, to_route_identifier: @transfer.to_route_identifier, to_stop_identifier: @transfer.to_stop_identifier, to_trip_identifier: @transfer.to_trip_identifier, transfer_type: @transfer.transfer_type } }
    end

    assert_redirected_to transfer_url(Transfer.last)
  end

  test "should show transfer" do
    get transfer_url(@transfer)
    assert_response :success
  end

  test "should get edit" do
    get edit_transfer_url(@transfer)
    assert_response :success
  end

  test "should update transfer" do
    patch transfer_url(@transfer), params: { transfer: { from_route_identifier: @transfer.from_route_identifier, from_stop_identifier: @transfer.from_stop_identifier, from_trip_identifier: @transfer.from_trip_identifier, min_transfer_time: @transfer.min_transfer_time, to_route_identifier: @transfer.to_route_identifier, to_stop_identifier: @transfer.to_stop_identifier, to_trip_identifier: @transfer.to_trip_identifier, transfer_type: @transfer.transfer_type } }
    assert_redirected_to transfer_url(@transfer)
  end

  test "should destroy transfer" do
    assert_difference('Transfer.count', -1) do
      delete transfer_url(@transfer)
    end

    assert_redirected_to transfers_url
  end
end
