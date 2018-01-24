require 'test_helper'

class TypeReqRespsControllerTest < ActionController::TestCase
  setup do
    @type_req_resp = type_req_resps(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:type_req_resps)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create type_req_resp" do
    assert_difference('TypeReqResp.count') do
      post :create, type_req_resp: { descripcion: @type_req_resp.descripcion }
    end

    assert_redirected_to type_req_resp_path(assigns(:type_req_resp))
  end

  test "should show type_req_resp" do
    get :show, id: @type_req_resp
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @type_req_resp
    assert_response :success
  end

  test "should update type_req_resp" do
    patch :update, id: @type_req_resp, type_req_resp: { descripcion: @type_req_resp.descripcion }
    assert_redirected_to type_req_resp_path(assigns(:type_req_resp))
  end

  test "should destroy type_req_resp" do
    assert_difference('TypeReqResp.count', -1) do
      delete :destroy, id: @type_req_resp
    end

    assert_redirected_to type_req_resps_path
  end
end
