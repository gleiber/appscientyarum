json.array!(@phones) do |phone|
  json.extract! phone, :id, :numero, :postgraduate_coordination_id
  json.url phone_url(phone, format: :json)
end
