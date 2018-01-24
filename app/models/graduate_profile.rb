class GraduateProfile < ApplicationRecord
	belongs_to :program
	validates :descripcion, presence:  {case_sensitive: false ,message: "No puede estar en blanco"}
end
