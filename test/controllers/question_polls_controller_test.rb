require 'test_helper'

class QuestionPollsControllerTest < ActionController::TestCase
  setup do
    @question_poll = question_polls(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:question_polls)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create question_poll" do
    assert_difference('QuestionPoll.count') do
      post :create, question_poll: { poll_id: @question_poll.poll_id, question_id: @question_poll.question_id }
    end

    assert_redirected_to question_poll_path(assigns(:question_poll))
  end

  test "should show question_poll" do
    get :show, id: @question_poll
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @question_poll
    assert_response :success
  end

  test "should update question_poll" do
    patch :update, id: @question_poll, question_poll: { poll_id: @question_poll.poll_id, question_id: @question_poll.question_id }
    assert_redirected_to question_poll_path(assigns(:question_poll))
  end

  test "should destroy question_poll" do
    assert_difference('QuestionPoll.count', -1) do
      delete :destroy, id: @question_poll
    end

    assert_redirected_to question_polls_path
  end
end
