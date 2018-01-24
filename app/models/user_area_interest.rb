class UserAreaInterest < ActiveRecord::Base
	include CodeGenerator
  belongs_to :area_interest
  belongs_to :user
end
