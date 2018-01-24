json.array!(@request_responses) do |request_response|
  json.extract! request_response, :id, :type_req_resp_id
  json.url request_response_url(request_response, format: :json)
end
