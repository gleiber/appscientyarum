json.extract! survey_response, :id, :poll_id, :sexo, :edad, :created_at, :updated_at
json.url survey_response_url(survey_response, format: :json)
