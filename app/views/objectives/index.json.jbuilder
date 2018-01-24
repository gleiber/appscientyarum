json.array!(@objectives) do |objective|
  json.extract! objective, :id, :descripcion, :postgraduate_coordination_id
  json.url objective_url(objective, format: :json)
end
