require 'test_helper'

class ReviewThesesControllerTest < ActionController::TestCase
  setup do
    @review_thesis = review_theses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:review_theses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create review_thesis" do
    assert_difference('ReviewThesis.count') do
      post :create, review_thesis: { thesis_id: @review_thesis.thesis_id, type_review: @review_thesis.type_review }
    end

    assert_redirected_to review_thesis_path(assigns(:review_thesis))
  end

  test "should show review_thesis" do
    get :show, id: @review_thesis
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @review_thesis
    assert_response :success
  end

  test "should update review_thesis" do
    patch :update, id: @review_thesis, review_thesis: { thesis_id: @review_thesis.thesis_id, type_review: @review_thesis.type_review }
    assert_redirected_to review_thesis_path(assigns(:review_thesis))
  end

  test "should destroy review_thesis" do
    assert_difference('ReviewThesis.count', -1) do
      delete :destroy, id: @review_thesis
    end

    assert_redirected_to review_theses_path
  end
end
