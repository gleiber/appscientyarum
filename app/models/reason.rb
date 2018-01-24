class Reason < ActiveRecord::Base
	include CodeGenerator
  belongs_to :type_reason
  belongs_to :request_classroom_laboratory
end
