require 'test_helper'

class PostulateCollectionProgramsControllerTest < ActionController::TestCase
  setup do
    @postulate_collection_program = postulate_collection_programs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:postulate_collection_programs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create postulate_collection_program" do
    assert_difference('PostulateCollectionProgram.count') do
      post :create, postulate_collection_program: { collection_program_id: @postulate_collection_program.collection_program_id, estado: @postulate_collection_program.estado, postulate_id: @postulate_collection_program.postulate_id }
    end

    assert_redirected_to postulate_collection_program_path(assigns(:postulate_collection_program))
  end

  test "should show postulate_collection_program" do
    get :show, id: @postulate_collection_program
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @postulate_collection_program
    assert_response :success
  end

  test "should update postulate_collection_program" do
    patch :update, id: @postulate_collection_program, postulate_collection_program: { collection_program_id: @postulate_collection_program.collection_program_id, estado: @postulate_collection_program.estado, postulate_id: @postulate_collection_program.postulate_id }
    assert_redirected_to postulate_collection_program_path(assigns(:postulate_collection_program))
  end

  test "should destroy postulate_collection_program" do
    assert_difference('PostulateCollectionProgram.count', -1) do
      delete :destroy, id: @postulate_collection_program
    end

    assert_redirected_to postulate_collection_programs_path
  end
end
