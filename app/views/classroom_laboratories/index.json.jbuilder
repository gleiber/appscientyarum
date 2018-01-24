json.array!(@classroom_laboratories) do |classroom_laboratory|
  json.extract! classroom_laboratory, :id, :descripcion
  json.url classroom_laboratory_url(classroom_laboratory, format: :json)
end
