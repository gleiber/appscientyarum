json.array!(@defending_theses) do |defending_thesis|
  json.extract! defending_thesis, :id, :fecha, :hora, :result_id, :lugar
  json.url defending_thesis_url(defending_thesis, format: :json)
end

