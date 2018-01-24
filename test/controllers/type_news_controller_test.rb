require 'test_helper'

class TypeNewsControllerTest < ActionController::TestCase
  setup do
    @type_news = type_news(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:type_news)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create type_news" do
    assert_difference('TypeNews.count') do
      post :create, type_news: { descripcion: @type_news.descripcion }
    end

    assert_redirected_to type_news_path(assigns(:type_news))
  end

  test "should show type_news" do
    get :show, id: @type_news
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @type_news
    assert_response :success
  end

  test "should update type_news" do
    patch :update, id: @type_news, type_news: { descripcion: @type_news.descripcion }
    assert_redirected_to type_news_path(assigns(:type_news))
  end

  test "should destroy type_news" do
    assert_difference('TypeNews.count', -1) do
      delete :destroy, id: @type_news
    end

    assert_redirected_to type_news_index_path
  end
end
