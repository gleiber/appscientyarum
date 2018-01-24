require 'test_helper'

class AreaInterestsControllerTest < ActionController::TestCase
  setup do
    @area_interest = area_interests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:area_interests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create area_interest" do
    assert_difference('AreaInterest.count') do
      post :create, area_interest: { descripcion: @area_interest.descripcion, line_investigation_id: @area_interest.line_investigation_id }
    end

    assert_redirected_to area_interest_path(assigns(:area_interest))
  end

  test "should show area_interest" do
    get :show, id: @area_interest
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @area_interest
    assert_response :success
  end

  test "should update area_interest" do
    patch :update, id: @area_interest, area_interest: { descripcion: @area_interest.descripcion, line_investigation_id: @area_interest.line_investigation_id }
    assert_redirected_to area_interest_path(assigns(:area_interest))
  end

  test "should destroy area_interest" do
    assert_difference('AreaInterest.count', -1) do
      delete :destroy, id: @area_interest
    end

    assert_redirected_to area_interests_path
  end
end
