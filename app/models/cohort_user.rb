class CohortUser < ApplicationRecord
  belongs_to :cohort_program
  belongs_to :user
  has_many :cohort_period_users
end
