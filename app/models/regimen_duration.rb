class RegimenDuration < ApplicationRecord
  belongs_to :program
  has_many :subject_regimen_durations
  has_many :subjects, through: :subject_regimen_durations
end
