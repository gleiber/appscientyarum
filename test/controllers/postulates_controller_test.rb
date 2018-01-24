require 'test_helper'

class PostulatesControllerTest < ActionController::TestCase
  setup do
    @postulate = postulates(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:postulates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create postulate" do
    assert_difference('Postulate.count') do
      post :create, postulate: { email: @postulate.email, nombre: @postulate.nombre, offer_id: @postulate.offer_id, telefono: @postulate.telefono }
    end

    assert_redirected_to postulate_path(assigns(:postulate))
  end

  test "should show postulate" do
    get :show, id: @postulate
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @postulate
    assert_response :success
  end

  test "should update postulate" do
    patch :update, id: @postulate, postulate: { email: @postulate.email, nombre: @postulate.nombre, offer_id: @postulate.offer_id, telefono: @postulate.telefono }
    assert_redirected_to postulate_path(assigns(:postulate))
  end

  test "should destroy postulate" do
    assert_difference('Postulate.count', -1) do
      delete :destroy, id: @postulate
    end

    assert_redirected_to postulates_path
  end
end
