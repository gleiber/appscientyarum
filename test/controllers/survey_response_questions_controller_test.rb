require 'test_helper'

class SurveyResponseQuestionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @survey_response_question = survey_response_questions(:one)
  end

  test "should get index" do
    get survey_response_questions_url
    assert_response :success
  end

  test "should get new" do
    get new_survey_response_question_url
    assert_response :success
  end

  test "should create survey_response_question" do
    assert_difference('SurveyResponseQuestion.count') do
      post survey_response_questions_url, params: { survey_response_question: { answer_id: @survey_response_question.answer_id, question_id: @survey_response_question.question_id, survey_response_id: @survey_response_question.survey_response_id } }
    end

    assert_redirected_to survey_response_question_url(SurveyResponseQuestion.last)
  end

  test "should show survey_response_question" do
    get survey_response_question_url(@survey_response_question)
    assert_response :success
  end

  test "should get edit" do
    get edit_survey_response_question_url(@survey_response_question)
    assert_response :success
  end

  test "should update survey_response_question" do
    patch survey_response_question_url(@survey_response_question), params: { survey_response_question: { answer_id: @survey_response_question.answer_id, question_id: @survey_response_question.question_id, survey_response_id: @survey_response_question.survey_response_id } }
    assert_redirected_to survey_response_question_url(@survey_response_question)
  end

  test "should destroy survey_response_question" do
    assert_difference('SurveyResponseQuestion.count', -1) do
      delete survey_response_question_url(@survey_response_question)
    end

    assert_redirected_to survey_response_questions_url
  end
end
