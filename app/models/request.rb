class Request < ActiveRecord::Base
	include CodeGenerator
  belongs_to :type_request
  belongs_to :user
end
