json.array!(@opinions) do |opinion|
  json.extract! opinion, :id, :user_id, :type_opinion_id
  json.url opinion_url(opinion, format: :json)
end
