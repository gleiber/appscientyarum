json.array!(@users) do |user|
  json.extract! user, :id, :username, :nombre, :email, :encrypted_password, :avatar, :role_id
  json.url user_url(user, format: :json)


	json.role do
		json.descripcion user.role.descripcion
	end

end


