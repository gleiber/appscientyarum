json.array!(@role_funcions) do |role_funcion|
  json.extract! role_funcion, :id, :role_id, :funcion_id
  json.url role_funcion_url(role_funcion, format: :json)
end
