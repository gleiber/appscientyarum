json.array!(@emails) do |email|
  json.extract! email, :id, :descripcion, :postgraduate_coordination_id
  json.url email_url(email, format: :json)
end
