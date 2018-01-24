json.array!(@type_poll_roles) do |type_poll_role|
  json.extract! type_poll_role, :id, :type_poll_id, :role_id
  json.url type_poll_role_url(type_poll_role, format: :json)
end
