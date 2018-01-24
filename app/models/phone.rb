class Phone < ActiveRecord::Base
	include CodeGenerator
  belongs_to :postgraduate_coordination
  validates :numero, presence:  {case_sensitive: false ,message: "No puede estar en blanco"}
end
