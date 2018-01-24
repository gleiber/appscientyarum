json.extract! @postgraduate_coordination, :id, :descripcion, :mision, :vision, :direccion, :created_at, :updated_at
json.objectives @postgraduate_coordination.objectives do |objetive|
	json.id objetive.id
	json.descripcion objetive.descripcion
end
json.emails @postgraduate_coordination.emails do |email|
	json.id email.id
	json.descripcion email.descripcion
end
json.phones @postgraduate_coordination.phones do |phone|
	json.id phone.id
	json.descripcion phone.numero
end