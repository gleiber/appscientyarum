json.array!(@classroom_laboratory_resources) do |classroom_laboratory_resource|
  json.extract! classroom_laboratory_resource, :id, :resource_id, :classroom_laboratory_id, :state_id
  json.url classroom_laboratory_resource_url(classroom_laboratory_resource, format: :json)
end
