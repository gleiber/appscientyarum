require 'test_helper'

class RequestClassLabsControllerTest < ActionController::TestCase
  setup do
    @request_class_lab = request_class_labs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:request_class_labs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create request_class_lab" do
    assert_difference('RequestClassLab.count') do
      post :create, request_class_lab: { classroom_laboratory_schedule_id: @request_class_lab.classroom_laboratory_schedule_id, user_id: @request_class_lab.user_id }
    end

    assert_redirected_to request_class_lab_path(assigns(:request_class_lab))
  end

  test "should show request_class_lab" do
    get :show, id: @request_class_lab
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @request_class_lab
    assert_response :success
  end

  test "should update request_class_lab" do
    patch :update, id: @request_class_lab, request_class_lab: { classroom_laboratory_schedule_id: @request_class_lab.classroom_laboratory_schedule_id, user_id: @request_class_lab.user_id }
    assert_redirected_to request_class_lab_path(assigns(:request_class_lab))
  end

  test "should destroy request_class_lab" do
    assert_difference('RequestClassLab.count', -1) do
      delete :destroy, id: @request_class_lab
    end

    assert_redirected_to request_class_labs_path
  end
end
