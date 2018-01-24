json.array!(@subject_users) do |subject_user|
  json.extract! subject_user, :id, :subject_id, :user_id
  json.url subject_user_url(subject_user, format: :json)
end
