class TypeReqResp < ActiveRecord::Base
	include CodeGenerator
	validates :descripcion, presence:  {case_sensitive: false}
end
