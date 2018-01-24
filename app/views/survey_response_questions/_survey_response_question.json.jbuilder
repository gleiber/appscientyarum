json.extract! survey_response_question, :id, :survey_response_id, :question_id, :answer_id, :created_at, :updated_at
json.url survey_response_question_url(survey_response_question, format: :json)
