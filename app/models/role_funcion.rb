class RoleFuncion < ActiveRecord::Base
	include CodeGenerator
  belongs_to :role
  belongs_to :funcion
end
