require 'test_helper'

class ProgramSubjectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @program_subject = program_subjects(:one)
  end

  test "should get index" do
    get program_subjects_url
    assert_response :success
  end

  test "should get new" do
    get new_program_subject_url
    assert_response :success
  end

  test "should create program_subject" do
    assert_difference('ProgramSubject.count') do
      post program_subjects_url, params: { program_subject: { program_id: @program_subject.program_id, subject_id: @program_subject.subject_id } }
    end

    assert_redirected_to program_subject_url(ProgramSubject.last)
  end

  test "should show program_subject" do
    get program_subject_url(@program_subject)
    assert_response :success
  end

  test "should get edit" do
    get edit_program_subject_url(@program_subject)
    assert_response :success
  end

  test "should update program_subject" do
    patch program_subject_url(@program_subject), params: { program_subject: { program_id: @program_subject.program_id, subject_id: @program_subject.subject_id } }
    assert_redirected_to program_subject_url(@program_subject)
  end

  test "should destroy program_subject" do
    assert_difference('ProgramSubject.count', -1) do
      delete program_subject_url(@program_subject)
    end

    assert_redirected_to program_subjects_url
  end
end
