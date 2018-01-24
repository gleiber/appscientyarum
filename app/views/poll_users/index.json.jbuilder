json.array!(@poll_users) do |poll_user|
  json.extract! poll_user, :id, :user_id, :poll_id
  json.url poll_user_url(poll_user, format: :json)
end
