class TypeCertificate < ApplicationRecord
	#include CodeGenerator
	 validates :descripcion, presence:  {case_sensitive: false, message: "No puede estar en blanco"}
end
