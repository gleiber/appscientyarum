class TypeReview < ActiveRecord::Base
	include CodeGenerator
	has_many :review_projects
	has_many :review_theses
	validates :descripcion, presence:  {case_sensitive: false,}
end
