require 'test_helper'

class EvaCommThesesControllerTest < ActionController::TestCase
  setup do
    @eva_comm_thesis = eva_comm_theses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:eva_comm_theses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create eva_comm_thesis" do
    assert_difference('EvaCommThesis.count') do
      post :create, eva_comm_thesis: { principal_1: @eva_comm_thesis.principal_1, principal_2: @eva_comm_thesis.principal_2, principal_3: @eva_comm_thesis.principal_3, suplente_1: @eva_comm_thesis.suplente_1, suplente_2: @eva_comm_thesis.suplente_2, suplente_3: @eva_comm_thesis.suplente_3, thesis_id: @eva_comm_thesis.thesis_id }
    end

    assert_redirected_to eva_comm_thesis_path(assigns(:eva_comm_thesis))
  end

  test "should show eva_comm_thesis" do
    get :show, id: @eva_comm_thesis
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @eva_comm_thesis
    assert_response :success
  end

  test "should update eva_comm_thesis" do
    patch :update, id: @eva_comm_thesis, eva_comm_thesis: { principal_1: @eva_comm_thesis.principal_1, principal_2: @eva_comm_thesis.principal_2, principal_3: @eva_comm_thesis.principal_3, suplente_1: @eva_comm_thesis.suplente_1, suplente_2: @eva_comm_thesis.suplente_2, suplente_3: @eva_comm_thesis.suplente_3, thesis_id: @eva_comm_thesis.thesis_id }
    assert_redirected_to eva_comm_thesis_path(assigns(:eva_comm_thesis))
  end

  test "should destroy eva_comm_thesis" do
    assert_difference('EvaCommThesis.count', -1) do
      delete :destroy, id: @eva_comm_thesis
    end

    assert_redirected_to eva_comm_theses_path
  end
end
