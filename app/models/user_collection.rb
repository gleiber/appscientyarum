class UserCollection < ActiveRecord::Base
	include CodeGenerator
  belongs_to :user
  belongs_to :collection
end
