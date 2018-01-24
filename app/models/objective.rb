class Objective < ActiveRecord::Base
	include CodeGenerator
  belongs_to :postgraduate_coordination
  	validates :descripcion, presence:  {case_sensitive: false ,message: "No puede estar en blanco"}
end
