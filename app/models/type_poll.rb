class TypePoll < ActiveRecord::Base
	include CodeGenerator
	has_many :polls
	has_many :roles, through: :type_poll_role
	validates :descripcion, presence:  {case_sensitive: false,message: "No puede estar en blanco"}
end
