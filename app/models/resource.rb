class Resource < ActiveRecord::Base
	include CodeGenerator
	has_many :classroom_laboratories, through: :classroom_laboratory_resource
    validates :descripcion, presence:  {case_sensitive: false ,message: "No puede estar en blanco"}
end
