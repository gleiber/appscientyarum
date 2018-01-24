class State < ActiveRecord::Base
	include CodeGenerator
	has_many :classroom_laboratory_resources 
	validates :descripcion, presence:  {case_sensitive: false}
end
