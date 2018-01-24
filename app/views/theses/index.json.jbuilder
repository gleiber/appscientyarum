json.array!(@theses) do |thesis|
  json.extract! thesis, :id, :project_id, :descripcion
  json.url thesis_url(thesis, format: :json)
end
