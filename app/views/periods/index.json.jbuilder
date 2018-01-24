json.array!(@periods) do |period|
  json.extract! period, :id, :descripcion
  json.url period_url(period, format: :json)
end
