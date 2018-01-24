class Schedule < ActiveRecord::Base
	include CodeGenerator
	has_many :schedule_cohort_periods
	has_many :classroom_laboratory_schedules 
end
