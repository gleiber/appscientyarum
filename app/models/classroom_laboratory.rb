class ClassroomLaboratory < ActiveRecord::Base
	include CodeGenerator
	has_many :resources, through: :classroom_laboratories_resource
	has_many :classroom_laboratory_schedule
	has_many :request_class_lab
	validates :descripcion, presence:  {case_sensitive: false ,message: "No puede estar en blanco"}
end
