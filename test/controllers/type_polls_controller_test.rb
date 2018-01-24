require 'test_helper'

class TypePollsControllerTest < ActionController::TestCase
  setup do
    @type_poll = type_polls(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:type_polls)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create type_poll" do
    assert_difference('TypePoll.count') do
      post :create, type_poll: { descripcion: @type_poll.descripcion }
    end

    assert_redirected_to type_poll_path(assigns(:type_poll))
  end

  test "should show type_poll" do
    get :show, id: @type_poll
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @type_poll
    assert_response :success
  end

  test "should update type_poll" do
    patch :update, id: @type_poll, type_poll: { descripcion: @type_poll.descripcion }
    assert_redirected_to type_poll_path(assigns(:type_poll))
  end

  test "should destroy type_poll" do
    assert_difference('TypePoll.count', -1) do
      delete :destroy, id: @type_poll
    end

    assert_redirected_to type_polls_path
  end
end
