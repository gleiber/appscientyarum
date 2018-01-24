json.array!(@keywords) do |keyword|
  json.extract! keyword, :id, :descripcion, :thesis_id
  json.url keyword_url(keyword, format: :json)
end
