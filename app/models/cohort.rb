class Cohort < ActiveRecord::Base
	include CodeGenerator
  belongs_to :program
  has_many :cohort_periods
  has_many :cohort_user
  has_many :users, through: :cohort_user

  validates :descripcion, presence:  {case_sensitive: false ,message: "No puede estar en blanco"}
end
