json.extract! estado, :id, :descripcion, :created_at, :updated_at
json.url estado_url(estado, format: :json)
json.cities estado.cities do |city|
	json.id city.id
	json.descripcion city.descripcion
end