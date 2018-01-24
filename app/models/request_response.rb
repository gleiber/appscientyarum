class RequestResponse < ActiveRecord::Base
	include CodeGenerator
  belongs_to :type_req_resp
  validates :descripcion, presence:  {case_sensitive: false}
end
