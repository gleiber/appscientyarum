json.array!(@schedules) do |schedule|
  json.extract! schedule, :id, :fecha, :hora_inicio, :hora_final
  json.url schedule_url(schedule, format: :json)
end
