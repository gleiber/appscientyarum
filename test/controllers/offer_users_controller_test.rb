require 'test_helper'

class OfferUsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @offer_user = offer_users(:one)
  end

  test "should get index" do
    get offer_users_url
    assert_response :success
  end

  test "should get new" do
    get new_offer_user_url
    assert_response :success
  end

  test "should create offer_user" do
    assert_difference('OfferUser.count') do
      post offer_users_url, params: { offer_user: { offer_id: @offer_user.offer_id, user_id: @offer_user.user_id } }
    end

    assert_redirected_to offer_user_url(OfferUser.last)
  end

  test "should show offer_user" do
    get offer_user_url(@offer_user)
    assert_response :success
  end

  test "should get edit" do
    get edit_offer_user_url(@offer_user)
    assert_response :success
  end

  test "should update offer_user" do
    patch offer_user_url(@offer_user), params: { offer_user: { offer_id: @offer_user.offer_id, user_id: @offer_user.user_id } }
    assert_redirected_to offer_user_url(@offer_user)
  end

  test "should destroy offer_user" do
    assert_difference('OfferUser.count', -1) do
      delete offer_user_url(@offer_user)
    end

    assert_redirected_to offer_users_url
  end
end
