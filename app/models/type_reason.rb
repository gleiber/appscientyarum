class TypeReason < ActiveRecord::Base
	include CodeGenerator
	has_many :motives
	validates :descripcion, presence:  {case_sensitive: false,message: "No puede estar en blanco"}
end
