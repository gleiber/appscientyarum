json.array!(@programs) do |program|
  json.extract! program, :id, :titulo, :descripcion, :duracion, :avatar
  json.url program_url(program, format: :json)
end
