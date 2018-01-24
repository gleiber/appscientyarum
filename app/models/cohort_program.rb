class CohortProgram < ApplicationRecord
  belongs_to :cohort
  belongs_to :program
  has_many :cohort_periods
  has_many :users

  validates :cohort_id, presence: {case_sensitive: false ,message:"No puede estar en Blanco"}

end
