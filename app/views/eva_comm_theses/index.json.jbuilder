json.array!(@eva_comm_theses) do |eva_comm_thesis|
  json.extract! eva_comm_thesis, :id, :principal_1, :principal_2, :principal_3, :suplente_1, :suplente_2, :suplente_3, :thesis_id
  json.url eva_comm_thesis_url(eva_comm_thesis, format: :json)
end

