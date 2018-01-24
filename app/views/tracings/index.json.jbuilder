json.array!(@tracings) do |tracing|
  json.extract! tracing, :id, :project_id, :descripcion
  json.url tracing_url(tracing, format: :json)
end
