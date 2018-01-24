json.array!(@projects) do |project|
  json.extract! project, :id, :tutor_id, :descripcion, :user_id, :area_interest_id
  json.url project_url(project, format: :json)
end

