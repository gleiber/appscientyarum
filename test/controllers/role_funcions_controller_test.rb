require 'test_helper'

class RoleFuncionsControllerTest < ActionController::TestCase
  setup do
    @role_funcion = role_funcions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:role_funcions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create role_funcion" do
    assert_difference('RoleFuncion.count') do
      post :create, role_funcion: { funcion_id: @role_funcion.funcion_id, role_id: @role_funcion.role_id }
    end

    assert_redirected_to role_funcion_path(assigns(:role_funcion))
  end

  test "should show role_funcion" do
    get :show, id: @role_funcion
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @role_funcion
    assert_response :success
  end

  test "should update role_funcion" do
    patch :update, id: @role_funcion, role_funcion: { funcion_id: @role_funcion.funcion_id, role_id: @role_funcion.role_id }
    assert_redirected_to role_funcion_path(assigns(:role_funcion))
  end

  test "should destroy role_funcion" do
    assert_difference('RoleFuncion.count', -1) do
      delete :destroy, id: @role_funcion
    end

    assert_redirected_to role_funcions_path
  end
end
