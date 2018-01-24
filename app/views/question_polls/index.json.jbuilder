json.array!(@question_polls) do |question_poll|
  json.extract! question_poll, :id, :question_id, :poll_id
  json.url question_poll_url(question_poll, format: :json)
end
