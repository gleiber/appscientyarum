json.array!(@answers) do |answer|
  json.extract! answer, :id, :descripcion
  json.url answer_url(answer, format: :json)
end
