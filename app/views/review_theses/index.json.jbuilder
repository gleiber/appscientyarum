json.array!(@review_theses) do |review_thesis|
  json.extract! review_thesis, :id, :thesis_id, :type_review
  json.url review_thesis_url(review_thesis, format: :json)
end
