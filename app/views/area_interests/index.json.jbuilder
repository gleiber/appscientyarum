json.array!(@area_interests) do |area_interest|
  json.extract! area_interest, :id, :line_investigation_id, :descripcion
  json.url area_interest_url(area_interest, format: :json)
end
