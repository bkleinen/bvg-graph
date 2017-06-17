require 'test_helper'

class CalendarDatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @calendar_date = calendar_dates(:one)
  end

  test "should get index" do
    get calendar_dates_url
    assert_response :success
  end

  test "should get new" do
    get new_calendar_date_url
    assert_response :success
  end

  test "should create calendar_date" do
    assert_difference('CalendarDate.count') do
      post calendar_dates_url, params: { calendar_date: { date: @calendar_date.date, exception_type: @calendar_date.exception_type, service_identifier: @calendar_date.service_identifier } }
    end

    assert_redirected_to calendar_date_url(CalendarDate.last)
  end

  test "should show calendar_date" do
    get calendar_date_url(@calendar_date)
    assert_response :success
  end

  test "should get edit" do
    get edit_calendar_date_url(@calendar_date)
    assert_response :success
  end

  test "should update calendar_date" do
    patch calendar_date_url(@calendar_date), params: { calendar_date: { date: @calendar_date.date, exception_type: @calendar_date.exception_type, service_identifier: @calendar_date.service_identifier } }
    assert_redirected_to calendar_date_url(@calendar_date)
  end

  test "should destroy calendar_date" do
    assert_difference('CalendarDate.count', -1) do
      delete calendar_date_url(@calendar_date)
    end

    assert_redirected_to calendar_dates_url
  end
end
