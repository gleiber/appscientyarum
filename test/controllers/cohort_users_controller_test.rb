require 'test_helper'

class CohortUsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cohort_user = cohort_users(:one)
  end

  test "should get index" do
    get cohort_users_url
    assert_response :success
  end

  test "should get new" do
    get new_cohort_user_url
    assert_response :success
  end

  test "should create cohort_user" do
    assert_difference('CohortUser.count') do
      post cohort_users_url, params: { cohort_user: { cohort_id: @cohort_user.cohort_id, user_id: @cohort_user.user_id } }
    end

    assert_redirected_to cohort_user_url(CohortUser.last)
  end

  test "should show cohort_user" do
    get cohort_user_url(@cohort_user)
    assert_response :success
  end

  test "should get edit" do
    get edit_cohort_user_url(@cohort_user)
    assert_response :success
  end

  test "should update cohort_user" do
    patch cohort_user_url(@cohort_user), params: { cohort_user: { cohort_id: @cohort_user.cohort_id, user_id: @cohort_user.user_id } }
    assert_redirected_to cohort_user_url(@cohort_user)
  end

  test "should destroy cohort_user" do
    assert_difference('CohortUser.count', -1) do
      delete cohort_user_url(@cohort_user)
    end

    assert_redirected_to cohort_users_url
  end
end
