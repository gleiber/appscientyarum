json.array!(@subjects) do |subject|
  json.extract! subject, :id, :descripcion, :program_id
  json.url subject_url(subject, format: :json)
end
