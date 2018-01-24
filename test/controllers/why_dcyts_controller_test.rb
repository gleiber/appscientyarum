require 'test_helper'

class WhyDcytsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @why_dcyt = why_dcyts(:one)
  end

  test "should get index" do
    get why_dcyts_url
    assert_response :success
  end

  test "should get new" do
    get new_why_dcyt_url
    assert_response :success
  end

  test "should create why_dcyt" do
    assert_difference('WhyDcyt.count') do
      post why_dcyts_url, params: { why_dcyt: { descripcion: @why_dcyt.descripcion } }
    end

    assert_redirected_to why_dcyt_url(WhyDcyt.last)
  end

  test "should show why_dcyt" do
    get why_dcyt_url(@why_dcyt)
    assert_response :success
  end

  test "should get edit" do
    get edit_why_dcyt_url(@why_dcyt)
    assert_response :success
  end

  test "should update why_dcyt" do
    patch why_dcyt_url(@why_dcyt), params: { why_dcyt: { descripcion: @why_dcyt.descripcion } }
    assert_redirected_to why_dcyt_url(@why_dcyt)
  end

  test "should destroy why_dcyt" do
    assert_difference('WhyDcyt.count', -1) do
      delete why_dcyt_url(@why_dcyt)
    end

    assert_redirected_to why_dcyts_url
  end
end
