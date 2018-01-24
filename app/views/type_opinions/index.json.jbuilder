json.array!(@type_opinions) do |type_opinion|
  json.extract! type_opinion, :id, :descripcion
  json.url type_opinion_url(type_opinion, format: :json)
end
