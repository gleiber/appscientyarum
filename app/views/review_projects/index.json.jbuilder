json.array!(@review_projects) do |review_project|
  json.extract! review_project, :id, :project_id, :type_review
  json.url review_project_url(review_project, format: :json)
end
