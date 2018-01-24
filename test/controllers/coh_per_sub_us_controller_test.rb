require 'test_helper'

class CohPerSubUsControllerTest < ActionController::TestCase
  setup do
    @coh_per_sub_u = coh_per_sub_us(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:coh_per_sub_us)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create coh_per_sub_u" do
    assert_difference('CohPerSubU.count') do
      post :create, coh_per_sub_u: { cohort_period_id: @coh_per_sub_u.cohort_period_id, schedule_cohort_period_id: @coh_per_sub_u.schedule_cohort_period_id, subject_user_id: @coh_per_sub_u.subject_user_id }
    end

    assert_redirected_to coh_per_sub_u_path(assigns(:coh_per_sub_u))
  end

  test "should show coh_per_sub_u" do
    get :show, id: @coh_per_sub_u
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @coh_per_sub_u
    assert_response :success
  end

  test "should update coh_per_sub_u" do
    patch :update, id: @coh_per_sub_u, coh_per_sub_u: { cohort_period_id: @coh_per_sub_u.cohort_period_id, schedule_cohort_period_id: @coh_per_sub_u.schedule_cohort_period_id, subject_user_id: @coh_per_sub_u.subject_user_id }
    assert_redirected_to coh_per_sub_u_path(assigns(:coh_per_sub_u))
  end

  test "should destroy coh_per_sub_u" do
    assert_difference('CohPerSubU.count', -1) do
      delete :destroy, id: @coh_per_sub_u
    end

    assert_redirected_to coh_per_sub_us_path
  end
end
