json.array!(@specialities) do |speciality|
  json.extract! speciality, :id, :descripcion, :academic_degree_id
  json.url speciality_url(speciality, format: :json)
end
