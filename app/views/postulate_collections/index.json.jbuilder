json.array!(@postulate_collections) do |postulate_collection|
  json.extract! postulate_collection, :id, :postulate_id, :collection_id
  json.url postulate_collection_url(postulate_collection, format: :json)
end
