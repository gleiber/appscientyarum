json.array!(@type_sliders) do |type_slider|
  json.extract! type_slider, :id, :descripcion
  json.url type_slider_url(type_slider, format: :json)
end
