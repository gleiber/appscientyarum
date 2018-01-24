require 'test_helper'

class TypeSlidersControllerTest < ActionController::TestCase
  setup do
    @type_slider = type_sliders(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:type_sliders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create type_slider" do
    assert_difference('TypeSlider.count') do
      post :create, type_slider: { descripcion: @type_slider.descripcion }
    end

    assert_redirected_to type_slider_path(assigns(:type_slider))
  end

  test "should show type_slider" do
    get :show, id: @type_slider
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @type_slider
    assert_response :success
  end

  test "should update type_slider" do
    patch :update, id: @type_slider, type_slider: { descripcion: @type_slider.descripcion }
    assert_redirected_to type_slider_path(assigns(:type_slider))
  end

  test "should destroy type_slider" do
    assert_difference('TypeSlider.count', -1) do
      delete :destroy, id: @type_slider
    end

    assert_redirected_to type_sliders_path
  end
end
