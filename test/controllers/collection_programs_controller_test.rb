require 'test_helper'

class CollectionProgramsControllerTest < ActionController::TestCase
  setup do
    @collection_program = collection_programs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:collection_programs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create collection_program" do
    assert_difference('CollectionProgram.count') do
      post :create, collection_program: { collection_id: @collection_program.collection_id, program_id: @collection_program.program_id }
    end

    assert_redirected_to collection_program_path(assigns(:collection_program))
  end

  test "should show collection_program" do
    get :show, id: @collection_program
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @collection_program
    assert_response :success
  end

  test "should update collection_program" do
    patch :update, id: @collection_program, collection_program: { collection_id: @collection_program.collection_id, program_id: @collection_program.program_id }
    assert_redirected_to collection_program_path(assigns(:collection_program))
  end

  test "should destroy collection_program" do
    assert_difference('CollectionProgram.count', -1) do
      delete :destroy, id: @collection_program
    end

    assert_redirected_to collection_programs_path
  end
end
