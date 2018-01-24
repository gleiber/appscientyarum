json.array!(@requests) do |request|
  json.extract! request, :id, :type_request_id, :user_id
  json.url request_url(request, format: :json)
end
