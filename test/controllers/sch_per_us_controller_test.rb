require 'test_helper'

class SchPerUsControllerTest < ActionController::TestCase
  setup do
    @sch_per_u = sch_per_us(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sch_per_us)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sch_per_u" do
    assert_difference('SchPerU.count') do
      post :create, sch_per_u: { coh_per_sub_u_id: @sch_per_u.coh_per_sub_u_id, nota: @sch_per_u.nota, user_id: @sch_per_u.user_id }
    end

    assert_redirected_to sch_per_u_path(assigns(:sch_per_u))
  end

  test "should show sch_per_u" do
    get :show, id: @sch_per_u
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sch_per_u
    assert_response :success
  end

  test "should update sch_per_u" do
    patch :update, id: @sch_per_u, sch_per_u: { coh_per_sub_u_id: @sch_per_u.coh_per_sub_u_id, nota: @sch_per_u.nota, user_id: @sch_per_u.user_id }
    assert_redirected_to sch_per_u_path(assigns(:sch_per_u))
  end

  test "should destroy sch_per_u" do
    assert_difference('SchPerU.count', -1) do
      delete :destroy, id: @sch_per_u
    end

    assert_redirected_to sch_per_us_path
  end
end
