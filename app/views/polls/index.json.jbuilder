json.array!(@polls) do |poll|
  json.extract! poll, :id, :descripcion, :type_poll_id, :estatus
  json.url poll_url(poll, format: :json) 
  json.questions poll.questions do |question|
	json.id question.id
	json.descripcion question.descripcion
	json.answers question.answers do |answer|
		json.id answer.id
		json.descripcion answer.descripcion
	end
  end
end
