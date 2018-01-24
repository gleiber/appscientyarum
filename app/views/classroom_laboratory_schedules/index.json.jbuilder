json.array!(@classroom_laboratory_schedules) do |classroom_laboratory_schedule|
  json.extract! classroom_laboratory_schedule, :id, :classroom_laboratory_id, :schedule_id
  json.url classroom_laboratory_schedule_url(classroom_laboratory_schedule, format: :json)
end
