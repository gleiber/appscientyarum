require 'test_helper'

class PostgraduateCoordinationsControllerTest < ActionController::TestCase
  setup do
    @postgraduate_coordination = postgraduate_coordinations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:postgraduate_coordinations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create postgraduate_coordination" do
    assert_difference('PostgraduateCoordination.count') do
      post :create, postgraduate_coordination: { descripcion: @postgraduate_coordination.descripcion, mision: @postgraduate_coordination.mision, vision: @postgraduate_coordination.vision }
    end

    assert_redirected_to postgraduate_coordination_path(assigns(:postgraduate_coordination))
  end

  test "should show postgraduate_coordination" do
    get :show, id: @postgraduate_coordination
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @postgraduate_coordination
    assert_response :success
  end

  test "should update postgraduate_coordination" do
    patch :update, id: @postgraduate_coordination, postgraduate_coordination: { descripcion: @postgraduate_coordination.descripcion, mision: @postgraduate_coordination.mision, vision: @postgraduate_coordination.vision }
    assert_redirected_to postgraduate_coordination_path(assigns(:postgraduate_coordination))
  end

  test "should destroy postgraduate_coordination" do
    assert_difference('PostgraduateCoordination.count', -1) do
      delete :destroy, id: @postgraduate_coordination
    end

    assert_redirected_to postgraduate_coordinations_path
  end
end
