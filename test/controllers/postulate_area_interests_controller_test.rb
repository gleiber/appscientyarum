require 'test_helper'

class PostulateAreaInterestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @postulate_area_interest = postulate_area_interests(:one)
  end

  test "should get index" do
    get postulate_area_interests_url
    assert_response :success
  end

  test "should get new" do
    get new_postulate_area_interest_url
    assert_response :success
  end

  test "should create postulate_area_interest" do
    assert_difference('PostulateAreaInterest.count') do
      post postulate_area_interests_url, params: { postulate_area_interest: { area_interest_id: @postulate_area_interest.area_interest_id, postulate_id: @postulate_area_interest.postulate_id } }
    end

    assert_redirected_to postulate_area_interest_url(PostulateAreaInterest.last)
  end

  test "should show postulate_area_interest" do
    get postulate_area_interest_url(@postulate_area_interest)
    assert_response :success
  end

  test "should get edit" do
    get edit_postulate_area_interest_url(@postulate_area_interest)
    assert_response :success
  end

  test "should update postulate_area_interest" do
    patch postulate_area_interest_url(@postulate_area_interest), params: { postulate_area_interest: { area_interest_id: @postulate_area_interest.area_interest_id, postulate_id: @postulate_area_interest.postulate_id } }
    assert_redirected_to postulate_area_interest_url(@postulate_area_interest)
  end

  test "should destroy postulate_area_interest" do
    assert_difference('PostulateAreaInterest.count', -1) do
      delete postulate_area_interest_url(@postulate_area_interest)
    end

    assert_redirected_to postulate_area_interests_url
  end
end
