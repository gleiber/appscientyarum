json.array!(@ownerships) do |ownership|
  json.extract! ownership, :id, :academic_degree_id, :speciality_id
  json.url ownership_url(ownership, format: :json)
  json.academic_degree do
  	json.descripcion ownership.academic_degree.descripcion
  end
  json.speciality do
  	json.descripcion ownership.speciality.descripcion
  end
end
