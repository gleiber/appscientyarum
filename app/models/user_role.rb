class UserRole < ActiveRecord::Base
	include CodeGenerator
  belongs_to :user
  belongs_to :role
end
