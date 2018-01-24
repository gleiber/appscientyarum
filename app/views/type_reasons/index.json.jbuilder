json.array!(@type_reasons) do |type_reason|
  json.extract! type_reason, :id, :descripcion
  json.url type_reason_url(type_reason, format: :json)
end
