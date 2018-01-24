class DefendingThesis < ActiveRecord::Base
	include CodeGenerator
  belongs_to :result
  belongs_to :thesis 
  has_one :request_class_lab



validates :fecha, presence:  {case_sensitive: false ,message: "No puede estar en blanco"}
validates  :hora, presence:  {case_sensitive: false ,message: "No puede estar en blanco"}
validates :lugar, presence:  {case_sensitive: false ,message: "No puede estar en blanco"}, length: {minimum: 10 ,message: "de la oferta no puede ser tan corto"}
  

  
end
