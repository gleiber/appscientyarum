json.array!(@reasons) do |reason|
  json.extract! reason, :id, :descipcion, :type_reason_id, :request_classroom_laboratory_id
  json.url reason_url(reason, format: :json)
end
