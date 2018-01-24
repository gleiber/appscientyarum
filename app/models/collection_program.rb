class CollectionProgram < ActiveRecord::Base
	include CodeGenerator
  belongs_to :program
  belongs_to :collection

  has_many :postulates, through: :postulate_collection_program
end