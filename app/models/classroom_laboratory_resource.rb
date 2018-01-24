class ClassroomLaboratoryResource < ActiveRecord::Base
	include CodeGenerator
  belongs_to :resource
  belongs_to :classroom_laboratory
  belongs_to :state
end
