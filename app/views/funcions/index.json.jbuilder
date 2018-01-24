json.array!(@funcions) do |funcion|
  json.extract! funcion, :id, :descripcion, :id_padre, :estatus, :url, :id_funcion
  json.url funcion_url(funcion, format: :json)
end
