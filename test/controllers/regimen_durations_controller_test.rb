require 'test_helper'

class RegimenDurationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @regimen_duration = regimen_durations(:one)
  end

  test "should get index" do
    get regimen_durations_url
    assert_response :success
  end

  test "should get new" do
    get new_regimen_duration_url
    assert_response :success
  end

  test "should create regimen_duration" do
    assert_difference('RegimenDuration.count') do
      post regimen_durations_url, params: { regimen_duration: { numero: @regimen_duration.numero, program_id: @regimen_duration.program_id } }
    end

    assert_redirected_to regimen_duration_url(RegimenDuration.last)
  end

  test "should show regimen_duration" do
    get regimen_duration_url(@regimen_duration)
    assert_response :success
  end

  test "should get edit" do
    get edit_regimen_duration_url(@regimen_duration)
    assert_response :success
  end

  test "should update regimen_duration" do
    patch regimen_duration_url(@regimen_duration), params: { regimen_duration: { numero: @regimen_duration.numero, program_id: @regimen_duration.program_id } }
    assert_redirected_to regimen_duration_url(@regimen_duration)
  end

  test "should destroy regimen_duration" do
    assert_difference('RegimenDuration.count', -1) do
      delete regimen_duration_url(@regimen_duration)
    end

    assert_redirected_to regimen_durations_url
  end
end
