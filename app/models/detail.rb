class Detail < ActiveRecord::Base
	include CodeGenerator
  belongs_to :postulate
  belongs_to :program
  validates :descripcion, presence:  {case_sensitive: false, message: "No puede estar en blanco"}
end
