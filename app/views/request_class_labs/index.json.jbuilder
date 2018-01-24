json.array!(@request_class_labs) do |request_class_lab|
  json.extract! request_class_lab, :id, :user_id, :classroom_laboratory_schedule_id
  json.url request_class_lab_url(request_class_lab, format: :json)
end
