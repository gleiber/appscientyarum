require 'test_helper'

class TypePollRolesControllerTest < ActionController::TestCase
  setup do
    @type_poll_role = type_poll_roles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:type_poll_roles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create type_poll_role" do
    assert_difference('TypePollRole.count') do
      post :create, type_poll_role: { role_id: @type_poll_role.role_id, type_poll_id: @type_poll_role.type_poll_id }
    end

    assert_redirected_to type_poll_role_path(assigns(:type_poll_role))
  end

  test "should show type_poll_role" do
    get :show, id: @type_poll_role
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @type_poll_role
    assert_response :success
  end

  test "should update type_poll_role" do
    patch :update, id: @type_poll_role, type_poll_role: { role_id: @type_poll_role.role_id, type_poll_id: @type_poll_role.type_poll_id }
    assert_redirected_to type_poll_role_path(assigns(:type_poll_role))
  end

  test "should destroy type_poll_role" do
    assert_difference('TypePollRole.count', -1) do
      delete :destroy, id: @type_poll_role
    end

    assert_redirected_to type_poll_roles_path
  end
end
