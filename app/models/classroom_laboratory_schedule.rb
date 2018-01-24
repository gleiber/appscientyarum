class ClassroomLaboratorySchedule < ActiveRecord::Base
	include CodeGenerator
  belongs_to :classroom_laboratory
  belongs_to :schedule
  has_many :sessions
  has_many :request_class_lab
end
