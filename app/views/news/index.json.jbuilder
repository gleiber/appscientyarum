json.array!(@news) do |news|
  json.extract! news, :id, :titulo, :descripcion, :avatar, :estado, :created_at
  json.url news_url(news, format: :json)
end
