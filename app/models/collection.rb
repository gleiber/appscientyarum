class Collection < ActiveRecord::Base
	include CodeGenerator
	has_many :postulates, through: :postulate_collection
	has_many :user_collection
	has_many :users, through: :user_collection

	has_many :program_collection
  	has_many :programs, through: :program_collection
  	validates :descripcion, presence:  {case_sensitive: false ,message: "No puede estar en blanco"}
end
