require 'test_helper'

class DefendingThesesControllerTest < ActionController::TestCase
  setup do
    @defending_thesis = defending_theses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:defending_theses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create defending_thesis" do
    assert_difference('DefendingThesis.count') do
      post :create, defending_thesis: { fecha: @defending_thesis.fecha, hora: @defending_thesis.hora, lugar: @defending_thesis.lugar, result_id: @defending_thesis.result_id }
    end

    assert_redirected_to defending_thesis_path(assigns(:defending_thesis))
  end

  test "should show defending_thesis" do
    get :show, id: @defending_thesis
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @defending_thesis
    assert_response :success
  end

  test "should update defending_thesis" do
    patch :update, id: @defending_thesis, defending_thesis: { fecha: @defending_thesis.fecha, hora: @defending_thesis.hora, lugar: @defending_thesis.lugar, result_id: @defending_thesis.result_id }
    assert_redirected_to defending_thesis_path(assigns(:defending_thesis))
  end

  test "should destroy defending_thesis" do
    assert_difference('DefendingThesis.count', -1) do
      delete :destroy, id: @defending_thesis
    end

    assert_redirected_to defending_theses_path
  end
end
