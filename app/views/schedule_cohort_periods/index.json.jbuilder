json.array!(@schedule_cohort_periods) do |schedule_cohort_period|
  json.extract! schedule_cohort_period, :id, :schedule_id, :cohort_period_id
  json.url schedule_cohort_period_url(schedule_cohort_period, format: :json)
end
