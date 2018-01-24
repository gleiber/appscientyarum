class Result < ActiveRecord::Base
	include CodeGenerator
  belongs_to :thesis
  has_one :defending_thesis
end
