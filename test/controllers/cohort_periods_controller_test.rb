require 'test_helper'

class CohortPeriodsControllerTest < ActionController::TestCase
  setup do
    @cohort_period = cohort_periods(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cohort_periods)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cohort_period" do
    assert_difference('CohortPeriod.count') do
      post :create, cohort_period: { cohort_id: @cohort_period.cohort_id, period_id: @cohort_period.period_id }
    end

    assert_redirected_to cohort_period_path(assigns(:cohort_period))
  end

  test "should show cohort_period" do
    get :show, id: @cohort_period
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cohort_period
    assert_response :success
  end

  test "should update cohort_period" do
    patch :update, id: @cohort_period, cohort_period: { cohort_id: @cohort_period.cohort_id, period_id: @cohort_period.period_id }
    assert_redirected_to cohort_period_path(assigns(:cohort_period))
  end

  test "should destroy cohort_period" do
    assert_difference('CohortPeriod.count', -1) do
      delete :destroy, id: @cohort_period
    end

    assert_redirected_to cohort_periods_path
  end
end
