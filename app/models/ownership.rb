class Ownership < ActiveRecord::Base
	include CodeGenerator
 
	belongs_to :academic_degree
	belongs_to :speciality
	has_many :user_ownership
  	has_many :users, through: :user_ownership
end
