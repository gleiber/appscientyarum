class PostgraduateCoordination < ActiveRecord::Base
	include CodeGenerator
  has_many :objectives
  has_many :emails
  has_many :phones
  has_many :programs

end
