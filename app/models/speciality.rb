class Speciality < ActiveRecord::Base
	include CodeGenerator
	has_many :ownership
	has_many :Academic_Degree, through: :ownership
end
