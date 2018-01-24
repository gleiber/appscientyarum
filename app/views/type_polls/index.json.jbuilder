json.array!(@type_polls) do |type_poll|
  json.extract! type_poll, :id, :descripcion
  json.url type_poll_url(type_poll, format: :json)
end
