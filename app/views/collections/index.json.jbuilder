json.array!(@collections) do |collection|
  json.extract! collection, :id, :descripcion
  json.url collection_url(collection, format: :json)
end
