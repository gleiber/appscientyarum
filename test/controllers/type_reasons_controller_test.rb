require 'test_helper'

class TypeReasonsControllerTest < ActionController::TestCase
  setup do
    @type_reason = type_reasons(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:type_reasons)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create type_reason" do
    assert_difference('TypeReason.count') do
      post :create, type_reason: { descripcion: @type_reason.descripcion }
    end

    assert_redirected_to type_reason_path(assigns(:type_reason))
  end

  test "should show type_reason" do
    get :show, id: @type_reason
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @type_reason
    assert_response :success
  end

  test "should update type_reason" do
    patch :update, id: @type_reason, type_reason: { descripcion: @type_reason.descripcion }
    assert_redirected_to type_reason_path(assigns(:type_reason))
  end

  test "should destroy type_reason" do
    assert_difference('TypeReason.count', -1) do
      delete :destroy, id: @type_reason
    end

    assert_redirected_to type_reasons_path
  end
end
