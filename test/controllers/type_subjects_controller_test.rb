require 'test_helper'

class TypeSubjectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @type_subject = type_subjects(:one)
  end

  test "should get index" do
    get type_subjects_url
    assert_response :success
  end

  test "should get new" do
    get new_type_subject_url
    assert_response :success
  end

  test "should create type_subject" do
    assert_difference('TypeSubject.count') do
      post type_subjects_url, params: { type_subject: { descripcion: @type_subject.descripcion, subject_id: @type_subject.subject_id } }
    end

    assert_redirected_to type_subject_url(TypeSubject.last)
  end

  test "should show type_subject" do
    get type_subject_url(@type_subject)
    assert_response :success
  end

  test "should get edit" do
    get edit_type_subject_url(@type_subject)
    assert_response :success
  end

  test "should update type_subject" do
    patch type_subject_url(@type_subject), params: { type_subject: { descripcion: @type_subject.descripcion, subject_id: @type_subject.subject_id } }
    assert_redirected_to type_subject_url(@type_subject)
  end

  test "should destroy type_subject" do
    assert_difference('TypeSubject.count', -1) do
      delete type_subject_url(@type_subject)
    end

    assert_redirected_to type_subjects_url
  end
end
