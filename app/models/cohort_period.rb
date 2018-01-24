class CohortPeriod < ActiveRecord::Base
	include CodeGenerator
  belongs_to :cohort_program
  belongs_to :period
  belongs_to :regimen_duration
  has_one :schedule_cohort_period
  has_many :coh_per_sub_us
  has_many :cohort_period_users
end
