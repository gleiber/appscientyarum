require 'test_helper'

class TypeOpinionsControllerTest < ActionController::TestCase
  setup do
    @type_opinion = type_opinions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:type_opinions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create type_opinion" do
    assert_difference('TypeOpinion.count') do
      post :create, type_opinion: { descripcion: @type_opinion.descripcion }
    end

    assert_redirected_to type_opinion_path(assigns(:type_opinion))
  end

  test "should show type_opinion" do
    get :show, id: @type_opinion
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @type_opinion
    assert_response :success
  end

  test "should update type_opinion" do
    patch :update, id: @type_opinion, type_opinion: { descripcion: @type_opinion.descripcion }
    assert_redirected_to type_opinion_path(assigns(:type_opinion))
  end

  test "should destroy type_opinion" do
    assert_difference('TypeOpinion.count', -1) do
      delete :destroy, id: @type_opinion
    end

    assert_redirected_to type_opinions_path
  end
end
