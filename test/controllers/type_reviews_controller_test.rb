require 'test_helper'

class TypeReviewsControllerTest < ActionController::TestCase
  setup do
    @type_review = type_reviews(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:type_reviews)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create type_review" do
    assert_difference('TypeReview.count') do
      post :create, type_review: { descripcion: @type_review.descripcion }
    end

    assert_redirected_to type_review_path(assigns(:type_review))
  end

  test "should show type_review" do
    get :show, id: @type_review
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @type_review
    assert_response :success
  end

  test "should update type_review" do
    patch :update, id: @type_review, type_review: { descripcion: @type_review.descripcion }
    assert_redirected_to type_review_path(assigns(:type_review))
  end

  test "should destroy type_review" do
    assert_difference('TypeReview.count', -1) do
      delete :destroy, id: @type_review
    end

    assert_redirected_to type_reviews_path
  end
end
