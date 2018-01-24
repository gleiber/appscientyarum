require 'test_helper'

class ProgramCalificationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @program_calification = program_califications(:one)
  end

  test "should get index" do
    get program_califications_url
    assert_response :success
  end

  test "should get new" do
    get new_program_calification_url
    assert_response :success
  end

  test "should create program_calification" do
    assert_difference('ProgramCalification.count') do
      post program_califications_url, params: { program_calification: { calification: @program_calification.calification, comment: @program_calification.comment, id_program: @program_calification.id_program, id_user: @program_calification.id_user } }
    end

    assert_redirected_to program_calification_url(ProgramCalification.last)
  end

  test "should show program_calification" do
    get program_calification_url(@program_calification)
    assert_response :success
  end

  test "should get edit" do
    get edit_program_calification_url(@program_calification)
    assert_response :success
  end

  test "should update program_calification" do
    patch program_calification_url(@program_calification), params: { program_calification: { calification: @program_calification.calification, comment: @program_calification.comment, id_program: @program_calification.id_program, id_user: @program_calification.id_user } }
    assert_redirected_to program_calification_url(@program_calification)
  end

  test "should destroy program_calification" do
    assert_difference('ProgramCalification.count', -1) do
      delete program_calification_url(@program_calification)
    end

    assert_redirected_to program_califications_url
  end
end
