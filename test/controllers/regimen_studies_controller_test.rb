require 'test_helper'

class RegimenStudiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @regimen_study = regimen_studies(:one)
  end

  test "should get index" do
    get regimen_studies_url
    assert_response :success
  end

  test "should get new" do
    get new_regimen_study_url
    assert_response :success
  end

  test "should create regimen_study" do
    assert_difference('RegimenStudy.count') do
      post regimen_studies_url, params: { regimen_study: { descripcion: @regimen_study.descripcion } }
    end

    assert_redirected_to regimen_study_url(RegimenStudy.last)
  end

  test "should show regimen_study" do
    get regimen_study_url(@regimen_study)
    assert_response :success
  end

  test "should get edit" do
    get edit_regimen_study_url(@regimen_study)
    assert_response :success
  end

  test "should update regimen_study" do
    patch regimen_study_url(@regimen_study), params: { regimen_study: { descripcion: @regimen_study.descripcion } }
    assert_redirected_to regimen_study_url(@regimen_study)
  end

  test "should destroy regimen_study" do
    assert_difference('RegimenStudy.count', -1) do
      delete regimen_study_url(@regimen_study)
    end

    assert_redirected_to regimen_studies_url
  end
end
