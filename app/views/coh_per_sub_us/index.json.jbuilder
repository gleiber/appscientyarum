json.array!(@coh_per_sub_us) do |coh_per_sub_u|
  json.extract! coh_per_sub_u, :id, :subject_user_id, :cohort_period_id, :schedule_cohort_period_id
  json.url coh_per_sub_u_url(coh_per_sub_u, format: :json)
end
