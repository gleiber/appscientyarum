require 'test_helper'

class ScheduleCohortPeriodsControllerTest < ActionController::TestCase
  setup do
    @schedule_cohort_period = schedule_cohort_periods(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:schedule_cohort_periods)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create schedule_cohort_period" do
    assert_difference('ScheduleCohortPeriod.count') do
      post :create, schedule_cohort_period: { cohort_period_id: @schedule_cohort_period.cohort_period_id, schedule_id: @schedule_cohort_period.schedule_id }
    end

    assert_redirected_to schedule_cohort_period_path(assigns(:schedule_cohort_period))
  end

  test "should show schedule_cohort_period" do
    get :show, id: @schedule_cohort_period
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @schedule_cohort_period
    assert_response :success
  end

  test "should update schedule_cohort_period" do
    patch :update, id: @schedule_cohort_period, schedule_cohort_period: { cohort_period_id: @schedule_cohort_period.cohort_period_id, schedule_id: @schedule_cohort_period.schedule_id }
    assert_redirected_to schedule_cohort_period_path(assigns(:schedule_cohort_period))
  end

  test "should destroy schedule_cohort_period" do
    assert_difference('ScheduleCohortPeriod.count', -1) do
      delete :destroy, id: @schedule_cohort_period
    end

    assert_redirected_to schedule_cohort_periods_path
  end
end
