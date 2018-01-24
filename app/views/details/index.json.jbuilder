json.array!(@details) do |detail|
  json.extract! detail, :id, :descripcion
  json.url detail_url(detail, format: :json)
end
