class EvaCommThesis < ActiveRecord::Base
	include CodeGenerator
  belongs_to :thesis


  validates :coordinador, presence:  {case_sensitive: false ,message: "No puede estar en blanco"}
  #validates :suplente_2, presence:  {case_sensitive: false ,message: "No puede estar en blanco"}
  #validates  :suplente_3, presence:  {case_sensitive: false ,message: "No puede estar en blanco"}
 
end

