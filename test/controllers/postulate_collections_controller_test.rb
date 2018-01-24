require 'test_helper'

class PostulateCollectionsControllerTest < ActionController::TestCase
  setup do
    @postulate_collection = postulate_collections(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:postulate_collections)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create postulate_collection" do
    assert_difference('PostulateCollection.count') do
      post :create, postulate_collection: { collection_id: @postulate_collection.collection_id, postulate_id: @postulate_collection.postulate_id }
    end

    assert_redirected_to postulate_collection_path(assigns(:postulate_collection))
  end

  test "should show postulate_collection" do
    get :show, id: @postulate_collection
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @postulate_collection
    assert_response :success
  end

  test "should update postulate_collection" do
    patch :update, id: @postulate_collection, postulate_collection: { collection_id: @postulate_collection.collection_id, postulate_id: @postulate_collection.postulate_id }
    assert_redirected_to postulate_collection_path(assigns(:postulate_collection))
  end

  test "should destroy postulate_collection" do
    assert_difference('PostulateCollection.count', -1) do
      delete :destroy, id: @postulate_collection
    end

    assert_redirected_to postulate_collections_path
  end
end
