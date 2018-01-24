json.extract! offer_user, :id, :offer_id, :user_id, :created_at, :updated_at
json.url offer_user_url(offer_user, format: :json)