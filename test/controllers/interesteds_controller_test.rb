require 'test_helper'

class InterestedsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @interested = interesteds(:one)
  end

  test "should get index" do
    get interesteds_url
    assert_response :success
  end

  test "should get new" do
    get new_interested_url
    assert_response :success
  end

  test "should create interested" do
    assert_difference('Interested.count') do
      post interesteds_url, params: { interested: { area_interest_id: @interested.area_interest_id, descripcion: @interested.descripcion, detail_id: @interested.detail_id, email: @interested.email, find_out_id: @interested.find_out_id, nombre: @interested.nombre, program_id: @interested.program_id, telefono: @interested.telefono, why_dcyt_id: @interested.why_dcyt_id } }
    end

    assert_redirected_to interested_url(Interested.last)
  end

  test "should show interested" do
    get interested_url(@interested)
    assert_response :success
  end

  test "should get edit" do
    get edit_interested_url(@interested)
    assert_response :success
  end

  test "should update interested" do
    patch interested_url(@interested), params: { interested: { area_interest_id: @interested.area_interest_id, descripcion: @interested.descripcion, detail_id: @interested.detail_id, email: @interested.email, find_out_id: @interested.find_out_id, nombre: @interested.nombre, program_id: @interested.program_id, telefono: @interested.telefono, why_dcyt_id: @interested.why_dcyt_id } }
    assert_redirected_to interested_url(@interested)
  end

  test "should destroy interested" do
    assert_difference('Interested.count', -1) do
      delete interested_url(@interested)
    end

    assert_redirected_to interesteds_url
  end
end
