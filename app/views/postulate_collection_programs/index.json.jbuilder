json.array!(@postulate_collection_programs) do |postulate_collection_program|
  json.extract! postulate_collection_program, :id, :postulate_id, :collection_program_id, :estado
  json.url postulate_collection_program_url(postulate_collection_program, format: :json)
end
