class CohortPeriodUser < ApplicationRecord
  belongs_to :cohort_period
  belongs_to :cohort_user
end
