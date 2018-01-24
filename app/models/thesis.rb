class Thesis < ActiveRecord::Base
	include CodeGenerator
	belongs_to :project
	has_many :keywords
	has_many :results
	has_many :review_theses
	has_one :eva_comm_thesis
	belongs_to :user
	belongs_to :line_investigation
	has_one :defending_thesis
	


end
