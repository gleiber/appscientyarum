json.array!(@type_news) do |type_news|
  json.extract! type_news, :id, :descripcion
  json.url type_news_url(type_news, format: :json)
end
