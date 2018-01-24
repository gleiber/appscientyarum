json.array!(@offers) do |offer|
  json.extract! offer, :id, :program_id, :titulo, :fecha_desde, :fecha_hasta, :avatar
  json.url offer_url(offer, format: :json)

	json.program do
		json.titulo offer.program.titulo
		json.descripcion offer.program.descripcion
	end
end
