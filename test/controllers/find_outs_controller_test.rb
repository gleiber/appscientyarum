require 'test_helper'

class FindOutsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @find_out = find_outs(:one)
  end

  test "should get index" do
    get find_outs_url
    assert_response :success
  end

  test "should get new" do
    get new_find_out_url
    assert_response :success
  end

  test "should create find_out" do
    assert_difference('FindOut.count') do
      post find_outs_url, params: { find_out: { descripcion: @find_out.descripcion } }
    end

    assert_redirected_to find_out_url(FindOut.last)
  end

  test "should show find_out" do
    get find_out_url(@find_out)
    assert_response :success
  end

  test "should get edit" do
    get edit_find_out_url(@find_out)
    assert_response :success
  end

  test "should update find_out" do
    patch find_out_url(@find_out), params: { find_out: { descripcion: @find_out.descripcion } }
    assert_redirected_to find_out_url(@find_out)
  end

  test "should destroy find_out" do
    assert_difference('FindOut.count', -1) do
      delete find_out_url(@find_out)
    end

    assert_redirected_to find_outs_url
  end
end
