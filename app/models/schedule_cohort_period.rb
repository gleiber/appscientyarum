class ScheduleCohortPeriod < ActiveRecord::Base
	include CodeGenerator
  belongs_to :schedule
  belongs_to :cohort_period
  has_many :coh_per_sub_us
end
