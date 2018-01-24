class Period < ActiveRecord::Base
	include CodeGenerator
	has_many :cohort_period
	has_one :programs

	validates :fecha_desde, presence:  {case_sensitive: false ,message: "No puede estar en blanco"} 
	validates :fecha_hasta, presence:  {case_sensitive: false ,message: "No puede estar en blanco"} 
end
