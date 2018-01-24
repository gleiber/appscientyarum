require 'test_helper'

class UserOwnershipsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_ownership = user_ownerships(:one)
  end

  test "should get index" do
    get user_ownerships_url
    assert_response :success
  end

  test "should get new" do
    get new_user_ownership_url
    assert_response :success
  end

  test "should create user_ownership" do
    assert_difference('UserOwnership.count') do
      post user_ownerships_url, params: { user_ownership: { ownership_id: @user_ownership.ownership_id, user_id: @user_ownership.user_id } }
    end

    assert_redirected_to user_ownership_url(UserOwnership.last)
  end

  test "should show user_ownership" do
    get user_ownership_url(@user_ownership)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_ownership_url(@user_ownership)
    assert_response :success
  end

  test "should update user_ownership" do
    patch user_ownership_url(@user_ownership), params: { user_ownership: { ownership_id: @user_ownership.ownership_id, user_id: @user_ownership.user_id } }
    assert_redirected_to user_ownership_url(@user_ownership)
  end

  test "should destroy user_ownership" do
    assert_difference('UserOwnership.count', -1) do
      delete user_ownership_url(@user_ownership)
    end

    assert_redirected_to user_ownerships_url
  end
end
