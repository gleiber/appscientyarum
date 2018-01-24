require 'test_helper'

class SubjectUsersControllerTest < ActionController::TestCase
  setup do
    @subject_user = subject_users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:subject_users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create subject_user" do
    assert_difference('SubjectUser.count') do
      post :create, subject_user: { subject_id: @subject_user.subject_id, user_id: @subject_user.user_id }
    end

    assert_redirected_to subject_user_path(assigns(:subject_user))
  end

  test "should show subject_user" do
    get :show, id: @subject_user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @subject_user
    assert_response :success
  end

  test "should update subject_user" do
    patch :update, id: @subject_user, subject_user: { subject_id: @subject_user.subject_id, user_id: @subject_user.user_id }
    assert_redirected_to subject_user_path(assigns(:subject_user))
  end

  test "should destroy subject_user" do
    assert_difference('SubjectUser.count', -1) do
      delete :destroy, id: @subject_user
    end

    assert_redirected_to subject_users_path
  end
end
