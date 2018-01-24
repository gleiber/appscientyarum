require 'test_helper'

class ProjectAreaInterestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @project_area_interest = project_area_interests(:one)
  end

  test "should get index" do
    get project_area_interests_url
    assert_response :success
  end

  test "should get new" do
    get new_project_area_interest_url
    assert_response :success
  end

  test "should create project_area_interest" do
    assert_difference('ProjectAreaInterest.count') do
      post project_area_interests_url, params: { project_area_interest: { area_interest_id: @project_area_interest.area_interest_id, project_id: @project_area_interest.project_id } }
    end

    assert_redirected_to project_area_interest_url(ProjectAreaInterest.last)
  end

  test "should show project_area_interest" do
    get project_area_interest_url(@project_area_interest)
    assert_response :success
  end

  test "should get edit" do
    get edit_project_area_interest_url(@project_area_interest)
    assert_response :success
  end

  test "should update project_area_interest" do
    patch project_area_interest_url(@project_area_interest), params: { project_area_interest: { area_interest_id: @project_area_interest.area_interest_id, project_id: @project_area_interest.project_id } }
    assert_redirected_to project_area_interest_url(@project_area_interest)
  end

  test "should destroy project_area_interest" do
    assert_difference('ProjectAreaInterest.count', -1) do
      delete project_area_interest_url(@project_area_interest)
    end

    assert_redirected_to project_area_interests_url
  end
end
