require 'test_helper'

class SubjectRegimenDurationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @subject_regimen_duration = subject_regimen_durations(:one)
  end

  test "should get index" do
    get subject_regimen_durations_url
    assert_response :success
  end

  test "should get new" do
    get new_subject_regimen_duration_url
    assert_response :success
  end

  test "should create subject_regimen_duration" do
    assert_difference('SubjectRegimenDuration.count') do
      post subject_regimen_durations_url, params: { subject_regimen_duration: { regimen_duration_id: @subject_regimen_duration.regimen_duration_id, subject_id: @subject_regimen_duration.subject_id } }
    end

    assert_redirected_to subject_regimen_duration_url(SubjectRegimenDuration.last)
  end

  test "should show subject_regimen_duration" do
    get subject_regimen_duration_url(@subject_regimen_duration)
    assert_response :success
  end

  test "should get edit" do
    get edit_subject_regimen_duration_url(@subject_regimen_duration)
    assert_response :success
  end

  test "should update subject_regimen_duration" do
    patch subject_regimen_duration_url(@subject_regimen_duration), params: { subject_regimen_duration: { regimen_duration_id: @subject_regimen_duration.regimen_duration_id, subject_id: @subject_regimen_duration.subject_id } }
    assert_redirected_to subject_regimen_duration_url(@subject_regimen_duration)
  end

  test "should destroy subject_regimen_duration" do
    assert_difference('SubjectRegimenDuration.count', -1) do
      delete subject_regimen_duration_url(@subject_regimen_duration)
    end

    assert_redirected_to subject_regimen_durations_url
  end
end
