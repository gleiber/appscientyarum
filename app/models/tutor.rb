class Tutor < ActiveRecord::Base
	include CodeGenerator
  belongs_to :user
  has_one :project
end
