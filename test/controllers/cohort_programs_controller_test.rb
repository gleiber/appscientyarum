require 'test_helper'

class CohortProgramsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cohort_program = cohort_programs(:one)
  end

  test "should get index" do
    get cohort_programs_url
    assert_response :success
  end

  test "should get new" do
    get new_cohort_program_url
    assert_response :success
  end

  test "should create cohort_program" do
    assert_difference('CohortProgram.count') do
      post cohort_programs_url, params: { cohort_program: { cohort_id: @cohort_program.cohort_id, program_id: @cohort_program.program_id } }
    end

    assert_redirected_to cohort_program_url(CohortProgram.last)
  end

  test "should show cohort_program" do
    get cohort_program_url(@cohort_program)
    assert_response :success
  end

  test "should get edit" do
    get edit_cohort_program_url(@cohort_program)
    assert_response :success
  end

  test "should update cohort_program" do
    patch cohort_program_url(@cohort_program), params: { cohort_program: { cohort_id: @cohort_program.cohort_id, program_id: @cohort_program.program_id } }
    assert_redirected_to cohort_program_url(@cohort_program)
  end

  test "should destroy cohort_program" do
    assert_difference('CohortProgram.count', -1) do
      delete cohort_program_url(@cohort_program)
    end

    assert_redirected_to cohort_programs_url
  end
end
