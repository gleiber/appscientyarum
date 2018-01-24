class TypePollRole < ActiveRecord::Base
	include CodeGenerator
  belongs_to :type_poll
  belongs_to :role
end
