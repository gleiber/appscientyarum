json.array!(@user_area_interests) do |user_area_interest|
  json.extract! user_area_interest, :id, :area_interest_id, :user_id
  json.url user_area_interest_url(user_area_interest, format: :json)
end
