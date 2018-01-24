require 'test_helper'

class TracingsControllerTest < ActionController::TestCase
  setup do
    @tracing = tracings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tracings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tracing" do
    assert_difference('Tracing.count') do
      post :create, tracing: { descripcion: @tracing.descripcion, project_id: @tracing.project_id }
    end

    assert_redirected_to tracing_path(assigns(:tracing))
  end

  test "should show tracing" do
    get :show, id: @tracing
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tracing
    assert_response :success
  end

  test "should update tracing" do
    patch :update, id: @tracing, tracing: { descripcion: @tracing.descripcion, project_id: @tracing.project_id }
    assert_redirected_to tracing_path(assigns(:tracing))
  end

  test "should destroy tracing" do
    assert_difference('Tracing.count', -1) do
      delete :destroy, id: @tracing
    end

    assert_redirected_to tracings_path
  end
end
