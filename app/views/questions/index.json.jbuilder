json.array!(@questions) do |question|
  json.extract! question, :id, :descripcion
  json.url question_url(question, format: :json)
end
