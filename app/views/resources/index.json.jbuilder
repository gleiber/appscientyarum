json.array!(@resources) do |resource|
  json.extract! resource, :id, :descripcion
  json.url resource_url(resource, format: :json)
end
