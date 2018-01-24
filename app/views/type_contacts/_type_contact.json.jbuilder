json.extract! type_contact, :id, :descripcion, :created_at, :updated_at
json.url type_contact_url(type_contact, format: :json)

json.contacts type_contact.contacts do |typecon|
	json.id typecon.id
	json.descripcion typecon.descripcion
	json.descripcion typecon.nombre
end