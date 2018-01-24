json.array!(@type_req_resps) do |type_req_resp|
  json.extract! type_req_resp, :id, :descripcion
  json.url type_req_resp_url(type_req_resp, format: :json)
end
