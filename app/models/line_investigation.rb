class LineInvestigation < ActiveRecord::Base
	include CodeGenerator
  belongs_to :program
  has_many :area_interests

  has_many :projects
  has_many :thesis
  has_many :users

validates :descripcion, presence:  {case_sensitive: false ,message: "No puede estar en blanco"}

end
