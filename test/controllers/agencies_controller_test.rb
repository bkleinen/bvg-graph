require 'test_helper'

class AgenciesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @agency = agencies(:one)
  end

  test "should get index" do
    get agencies_url
    assert_response :success
  end

  test "should get new" do
    get new_agency_url
    assert_response :success
  end

  test "should create agency" do
    assert_difference('Agency.count') do
      post agencies_url, params: { agency: { agency_identifier: @agency.agency_identifier, agency_lang: @agency.agency_lang, agency_name: @agency.agency_name, agency_phone: @agency.agency_phone, agency_timezone: @agency.agency_timezone, agency_url: @agency.agency_url } }
    end

    assert_redirected_to agency_url(Agency.last)
  end

  test "should show agency" do
    get agency_url(@agency)
    assert_response :success
  end

  test "should get edit" do
    get edit_agency_url(@agency)
    assert_response :success
  end

  test "should update agency" do
    patch agency_url(@agency), params: { agency: { agency_identifier: @agency.agency_identifier, agency_lang: @agency.agency_lang, agency_name: @agency.agency_name, agency_phone: @agency.agency_phone, agency_timezone: @agency.agency_timezone, agency_url: @agency.agency_url } }
    assert_redirected_to agency_url(@agency)
  end

  test "should destroy agency" do
    assert_difference('Agency.count', -1) do
      delete agency_url(@agency)
    end

    assert_redirected_to agencies_url
  end
end
