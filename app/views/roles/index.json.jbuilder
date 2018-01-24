json.array!(@roles) do |role|
  json.extract! role, :id, :descripcion, :estado
  json.url role_url(role, format: :json)
end
