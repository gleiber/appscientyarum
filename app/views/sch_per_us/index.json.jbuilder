json.array!(@sch_per_us) do |sch_per_u|
  json.extract! sch_per_u, :id, :user_id, :coh_per_sub_u_id, :nota
  json.url sch_per_u_url(sch_per_u, format: :json)
end
