require 'test_helper'

class SubPerUsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sub_per_user = sub_per_users(:one)
  end

  test "should get index" do
    get sub_per_users_url
    assert_response :success
  end

  test "should get new" do
    get new_sub_per_user_url
    assert_response :success
  end

  test "should create sub_per_user" do
    assert_difference('SubPerUser.count') do
      post sub_per_users_url, params: { sub_per_user: { coh_per_sub_us_id: @sub_per_user.coh_per_sub_us_id, nota: @sub_per_user.nota, user_id: @sub_per_user.user_id } }
    end

    assert_redirected_to sub_per_user_url(SubPerUser.last)
  end

  test "should show sub_per_user" do
    get sub_per_user_url(@sub_per_user)
    assert_response :success
  end

  test "should get edit" do
    get edit_sub_per_user_url(@sub_per_user)
    assert_response :success
  end

  test "should update sub_per_user" do
    patch sub_per_user_url(@sub_per_user), params: { sub_per_user: { coh_per_sub_us_id: @sub_per_user.coh_per_sub_us_id, nota: @sub_per_user.nota, user_id: @sub_per_user.user_id } }
    assert_redirected_to sub_per_user_url(@sub_per_user)
  end

  test "should destroy sub_per_user" do
    assert_difference('SubPerUser.count', -1) do
      delete sub_per_user_url(@sub_per_user)
    end

    assert_redirected_to sub_per_users_url
  end
end
