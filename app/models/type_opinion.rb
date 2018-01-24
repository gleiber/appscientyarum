class TypeOpinion < ActiveRecord::Base
	include CodeGenerator
	has_many :opinions
	validates :descripcion, presence:  {case_sensitive: false,message: "No puede estar en blanco"}
end
