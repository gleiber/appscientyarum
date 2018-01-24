json.array!(@postulates) do |postulate|
  json.extract! postulate, :id, :offer_id, :nombre, :email, :telefono
  json.url postulate_url(postulate, format: :json)
end
