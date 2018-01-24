json.array!(@history_notes) do |history_note|
  json.extract! history_note, :id, :cohorte, :periodo, :participante, :materia, :nota
  json.url history_note_url(history_note, format: :json)
end
