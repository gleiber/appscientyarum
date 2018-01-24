class SubjectRegimenDuration < ApplicationRecord
  belongs_to :regimen_duration
  belongs_to :subject
  validates :subject_id, presence: {case_sensitive: false ,message:"Debe escoger una materia"}
end
