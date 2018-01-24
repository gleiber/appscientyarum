require 'test_helper'

class ReviewProjectsControllerTest < ActionController::TestCase
  setup do
    @review_project = review_projects(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:review_projects)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create review_project" do
    assert_difference('ReviewProject.count') do
      post :create, review_project: { project_id: @review_project.project_id, type_review: @review_project.type_review }
    end

    assert_redirected_to review_project_path(assigns(:review_project))
  end

  test "should show review_project" do
    get :show, id: @review_project
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @review_project
    assert_response :success
  end

  test "should update review_project" do
    patch :update, id: @review_project, review_project: { project_id: @review_project.project_id, type_review: @review_project.type_review }
    assert_redirected_to review_project_path(assigns(:review_project))
  end

  test "should destroy review_project" do
    assert_difference('ReviewProject.count', -1) do
      delete :destroy, id: @review_project
    end

    assert_redirected_to review_projects_path
  end
end
