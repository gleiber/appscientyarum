json.array!(@line_investigations) do |line_investigation|
  json.extract! line_investigation, :id, :descripcion, :program_id
  json.url line_investigation_url(line_investigation, format: :json)
end
