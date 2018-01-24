class Modality < ApplicationRecord
	include CodeGenerator
	has_many :programs
	validates :descripcion, presence:  {case_sensitive: false,message: "No puede estar en blanco"}
end
