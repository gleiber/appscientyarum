class Session < ActiveRecord::Base
	include CodeGenerator
  belongs_to :classroom_laboratory_schedule
  belongs_to :coh_per_sub_u
end
