class AreaInterest < ActiveRecord::Base
	include CodeGenerator
  belongs_to :line_investigation
  has_many :projects
  has_many :user_area_interest
  has_many :users, through: :user_area_interest
  has_many :project_area_interest
  has_many :projects, through: :project_area_interest
 
 validates :descripcion, presence:  {case_sensitive: false ,message: "No puede estar en blanco"}

end

