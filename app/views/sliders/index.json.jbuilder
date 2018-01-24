json.array!(@sliders) do |slider|
  json.extract! slider, :id, :titulo, :descripcion, :avatar
  json.url slider_url(slider, format: :json)
end

