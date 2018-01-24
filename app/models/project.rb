class Project < ActiveRecord::Base
	include CodeGenerator
  belongs_to :user
  #belongs_to :area_interest
  #belongs_to :program
  #belongs_to :line_investigation
  #belongs_to :cohort
  has_many :review_projects
  has_one :thesis
  has_one :eva_comm_proj
  belongs_to :line_investigation
  has_many :project_area_interest
  has_many :area_interests, through: :project_area_interest 
  accepts_nested_attributes_for :user

  


  
  validates :user_id, presence:  {case_sensitive: false ,message: "No puede estar en blanco"}
  validates  :tutor, presence:  {case_sensitive: false ,message: "No puede estar en blanco"}
  validates :titulo, presence:  {case_sensitive: false ,message: "No puede estar en blanco"}, length: {minimum: 10 ,message: "de la oferta no puede ser tan corto"}
  validates :line_investigation_id, presence:  {case_sensitive: false ,message: "No puede estar en blanco"}
end


