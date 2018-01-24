class EvaCommProj < ActiveRecord::Base
	include CodeGenerator
  belongs_to :project



  validates :principal_1, presence:  {case_sensitive: false ,message: "No puede estar en blanco"}
  validates  :principal_2, presence:  {case_sensitive: false ,message: "No puede estar en blanco"}
  validates :principal_3, presence:  {case_sensitive: false ,message: "No puede estar en blanco"}   
  validates :coordinador, presence:  {case_sensitive: false ,message: "No puede estar en blanco"} 

end

