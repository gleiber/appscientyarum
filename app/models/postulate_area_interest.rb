class PostulateAreaInterest < ApplicationRecord
	include CodeGenerator
  belongs_to :area_interest
  belongs_to :postulate
end
