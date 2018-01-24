require 'test_helper'

class UserAreaInterestsControllerTest < ActionController::TestCase
  setup do
    @user_area_interest = user_area_interests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_area_interests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_area_interest" do
    assert_difference('UserAreaInterest.count') do
      post :create, user_area_interest: { area_interest_id: @user_area_interest.area_interest_id, user_id: @user_area_interest.user_id }
    end

    assert_redirected_to user_area_interest_path(assigns(:user_area_interest))
  end

  test "should show user_area_interest" do
    get :show, id: @user_area_interest
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_area_interest
    assert_response :success
  end

  test "should update user_area_interest" do
    patch :update, id: @user_area_interest, user_area_interest: { area_interest_id: @user_area_interest.area_interest_id, user_id: @user_area_interest.user_id }
    assert_redirected_to user_area_interest_path(assigns(:user_area_interest))
  end

  test "should destroy user_area_interest" do
    assert_difference('UserAreaInterest.count', -1) do
      delete :destroy, id: @user_area_interest
    end

    assert_redirected_to user_area_interests_path
  end
end
