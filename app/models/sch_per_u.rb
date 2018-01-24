class SchPerU < ActiveRecord::Base
	include CodeGenerator
  belongs_to :user
  belongs_to :coh_per_sub_u
  has_one :history_note
end
