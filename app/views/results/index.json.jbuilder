json.array!(@results) do |result|
  json.extract! result, :id, :descripcion, :thesis_id
  json.url result_url(result, format: :json)
end

