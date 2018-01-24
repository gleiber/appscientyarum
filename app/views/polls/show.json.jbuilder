json.extract! @poll, :id, :descripcion, :type_poll_id, :created_at, :updated_at
json.questions @poll.questions do |question|
	json.id question.id
	json.descripcion question.descripcion
	json.answers question.answers do |answer|
		json.id answer.id
		json.descripcion answer.descripcion
	end
end