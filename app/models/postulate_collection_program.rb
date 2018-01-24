class PostulateCollectionProgram < ActiveRecord::Base
	include CodeGenerator
  belongs_to :postulate
  belongs_to :collection_program
end
