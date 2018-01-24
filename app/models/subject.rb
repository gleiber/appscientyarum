class Subject < ActiveRecord::Base
	include CodeGenerator
	has_many :program_subjects
	has_many :program, through: :program_subjects
	has_many :users, through: :subject_user
	belongs_to :type_subject
	has_many :subject_regimen_durations
  	has_many :regimen_durations, through: :subject_regimen_durations
  	has_many :sub_per_user
  	has_many :users, through: :sub_per_user

	validates :descripcion, presence:  {case_sensitive: false ,message: "No puede estar en blanco"}
	validates :unidades_credito, presence:  {case_sensitive: false ,message: "No puede estar en blanco"}
	validates :type_subject, presence:  {case_sensitive: false ,message: "No puede estar en blanco"}
end