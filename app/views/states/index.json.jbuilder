json.array!(@states) do |state|
  json.extract! state, :id, :descripcion
  json.url state_url(state, format: :json)
end
