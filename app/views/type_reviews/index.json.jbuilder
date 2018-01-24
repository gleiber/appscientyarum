json.array!(@type_reviews) do |type_review|
  json.extract! type_review, :id, :descripcion
  json.url type_review_url(type_review, format: :json)
end
