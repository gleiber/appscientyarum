json.extract! @program, :id, :titulo, :descripcion, :avatar, :regimen_study_id,:modality_id, :created_at, :updated_at, :duracion
json.modality do
	json.descripcion @program.modality.descripcion
end
json.regimen_study do
	json.id @program.regimen_study.id
	json.descripcion @program.regimen_study.descripcion
end
json.line_investigations do |line_investigation|
	json.extract! line_investigation, :descripcion
end
json.user do
	json.id @program.user.id
	json.descripcion @program.user.nombre
end

json.line_investigations @program.line_investigations do |line_investigation|
	json.id line_investigation.id
	json.descripcion line_investigation.descripcion
end

json.graduate_profiles @program.graduate_profiles do |graduate_profile|
	json.id graduate_profile.id
	json.descripcion graduate_profile.descripcion
end

json.collections @program.collections do |collection|
	json.descripcion collection.descripcion
end
json.regimen_durations @program.regimen_durations do |regimen_duration|
	json.numero regimen_duration.numero
	json.subjects regimen_duration.subjects do |subject|
		json.descripcion subject.descripcion
		json.type_subject do
			json.descripcion subject.type_subject.descripcion
		end
	end
end
