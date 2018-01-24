require 'test_helper'

class CivilStatusesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @civil_status = civil_statuses(:one)
  end

  test "should get index" do
    get civil_statuses_url
    assert_response :success
  end

  test "should get new" do
    get new_civil_status_url
    assert_response :success
  end

  test "should create civil_status" do
    assert_difference('CivilStatus.count') do
      post civil_statuses_url, params: { civil_status: { descripcion: @civil_status.descripcion } }
    end

    assert_redirected_to civil_status_url(CivilStatus.last)
  end

  test "should show civil_status" do
    get civil_status_url(@civil_status)
    assert_response :success
  end

  test "should get edit" do
    get edit_civil_status_url(@civil_status)
    assert_response :success
  end

  test "should update civil_status" do
    patch civil_status_url(@civil_status), params: { civil_status: { descripcion: @civil_status.descripcion } }
    assert_redirected_to civil_status_url(@civil_status)
  end

  test "should destroy civil_status" do
    assert_difference('CivilStatus.count', -1) do
      delete civil_status_url(@civil_status)
    end

    assert_redirected_to civil_statuses_url
  end
end
