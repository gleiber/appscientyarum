class AcademicDegree < ActiveRecord::Base
	include CodeGenerator
	has_many :ownership
	has_many :specialities, through: :ownership
	validates :descripcion, presence:  {case_sensitive: false,message: "No puede estar en blanco"}
end
