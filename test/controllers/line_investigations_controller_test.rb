require 'test_helper'

class LineInvestigationsControllerTest < ActionController::TestCase
  setup do
    @line_investigation = line_investigations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:line_investigations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create line_investigation" do
    assert_difference('LineInvestigation.count') do
      post :create, line_investigation: { descripcion: @line_investigation.descripcion, program_id: @line_investigation.program_id }
    end

    assert_redirected_to line_investigation_path(assigns(:line_investigation))
  end

  test "should show line_investigation" do
    get :show, id: @line_investigation
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @line_investigation
    assert_response :success
  end

  test "should update line_investigation" do
    patch :update, id: @line_investigation, line_investigation: { descripcion: @line_investigation.descripcion, program_id: @line_investigation.program_id }
    assert_redirected_to line_investigation_path(assigns(:line_investigation))
  end

  test "should destroy line_investigation" do
    assert_difference('LineInvestigation.count', -1) do
      delete :destroy, id: @line_investigation
    end

    assert_redirected_to line_investigations_path
  end
end
