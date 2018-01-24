require 'test_helper'

class ClassroomLaboratoriesControllerTest < ActionController::TestCase
  setup do
    @classroom_laboratory = classroom_laboratories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:classroom_laboratories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create classroom_laboratory" do
    assert_difference('ClassroomLaboratory.count') do
      post :create, classroom_laboratory: { descripcion: @classroom_laboratory.descripcion }
    end

    assert_redirected_to classroom_laboratory_path(assigns(:classroom_laboratory))
  end

  test "should show classroom_laboratory" do
    get :show, id: @classroom_laboratory
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @classroom_laboratory
    assert_response :success
  end

  test "should update classroom_laboratory" do
    patch :update, id: @classroom_laboratory, classroom_laboratory: { descripcion: @classroom_laboratory.descripcion }
    assert_redirected_to classroom_laboratory_path(assigns(:classroom_laboratory))
  end

  test "should destroy classroom_laboratory" do
    assert_difference('ClassroomLaboratory.count', -1) do
      delete :destroy, id: @classroom_laboratory
    end

    assert_redirected_to classroom_laboratories_path
  end
end
