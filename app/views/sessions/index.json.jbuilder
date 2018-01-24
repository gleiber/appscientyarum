json.array!(@sessions) do |session|
  json.extract! session, :id, :classroom_laboratory_schedule_id, :coh_per_sub_u_id
  json.url session_url(session, format: :json)
end
