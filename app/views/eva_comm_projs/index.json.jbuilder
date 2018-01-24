json.array!(@eva_comm_projs) do |eva_comm_proj|
  json.extract! eva_comm_proj, :id, :principal_1, :principal_2, :principal_3, :suplente_1, :suplente_2, :suplente_3, :project_id
  json.url eva_comm_proj_url(eva_comm_proj, format: :json)
end

