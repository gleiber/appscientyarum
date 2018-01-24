class ReviewThesis < ActiveRecord::Base
	include CodeGenerator
  belongs_to :thesis
  belongs_to :type_review





  
  validates :type_review, presence:  {case_sensitive: false ,message: "No puede estar en blanco"}
  validates  :descripcion, presence:  {case_sensitive: false ,message: "No puede estar en blanco"}
  
end
