require 'test_helper'

class RequestResponsesControllerTest < ActionController::TestCase
  setup do
    @request_response = request_responses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:request_responses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create request_response" do
    assert_difference('RequestResponse.count') do
      post :create, request_response: { type_req_resp_id: @request_response.type_req_resp_id }
    end

    assert_redirected_to request_response_path(assigns(:request_response))
  end

  test "should show request_response" do
    get :show, id: @request_response
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @request_response
    assert_response :success
  end

  test "should update request_response" do
    patch :update, id: @request_response, request_response: { type_req_resp_id: @request_response.type_req_resp_id }
    assert_redirected_to request_response_path(assigns(:request_response))
  end

  test "should destroy request_response" do
    assert_difference('RequestResponse.count', -1) do
      delete :destroy, id: @request_response
    end

    assert_redirected_to request_responses_path
  end
end
