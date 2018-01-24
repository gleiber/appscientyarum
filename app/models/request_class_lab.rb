class RequestClassLab < ActiveRecord::Base
	#include CodeGenerator
  belongs_to :user
  belongs_to :classroom_laboratory_schedule
  has_many :reason
  belongs_to :defending_thesis
  belongs_to :event
 
    validates :solicitante, presence:  {case_sensitive: false ,message: "No puede estar en blanco"}
    validates :descripcion, presence:  {case_sensitive: false ,message: "No puede estar en blanco"}
    validates :start, presence:  {case_sensitive: false ,message: "No puede estar en blanco"} 
    validates :end, presence:  {case_sensitive: false ,message: "No puede estar en blanco"}

end
