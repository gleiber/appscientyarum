json.array!(@cohort_periods) do |cohort_period|
  json.extract! cohort_period, :id, :cohort_id, :period_id
  json.url cohort_period_url(cohort_period, format: :json)
end
