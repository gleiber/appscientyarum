require 'test_helper'

class EvaCommProjsControllerTest < ActionController::TestCase
  setup do
    @eva_comm_proj = eva_comm_projs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:eva_comm_projs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create eva_comm_proj" do
    assert_difference('EvaCommProj.count') do
      post :create, eva_comm_proj: { principal_1: @eva_comm_proj.principal_1, principal_2: @eva_comm_proj.principal_2, principal_3: @eva_comm_proj.principal_3, project_id: @eva_comm_proj.project_id, suplente_1: @eva_comm_proj.suplente_1, suplente_2: @eva_comm_proj.suplente_2, suplente_3: @eva_comm_proj.suplente_3 }
    end

    assert_redirected_to eva_comm_proj_path(assigns(:eva_comm_proj))
  end

  test "should show eva_comm_proj" do
    get :show, id: @eva_comm_proj
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @eva_comm_proj
    assert_response :success
  end

  test "should update eva_comm_proj" do
    patch :update, id: @eva_comm_proj, eva_comm_proj: { principal_1: @eva_comm_proj.principal_1, principal_2: @eva_comm_proj.principal_2, principal_3: @eva_comm_proj.principal_3, project_id: @eva_comm_proj.project_id, suplente_1: @eva_comm_proj.suplente_1, suplente_2: @eva_comm_proj.suplente_2, suplente_3: @eva_comm_proj.suplente_3 }
    assert_redirected_to eva_comm_proj_path(assigns(:eva_comm_proj))
  end

  test "should destroy eva_comm_proj" do
    assert_difference('EvaCommProj.count', -1) do
      delete :destroy, id: @eva_comm_proj
    end

    assert_redirected_to eva_comm_projs_path
  end
end
