json.array!(@collection_programs) do |collection_program|
  json.extract! collection_program, :id, :program_id, :collection_id
  json.url collection_program_url(collection_program, format: :json)
end
