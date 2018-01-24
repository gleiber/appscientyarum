class Funcion < ActiveRecord::Base
	include CodeGenerator
	belongs_to :system
	has_many :role_funcion
	has_many :roles, through: :role_funcion

end
