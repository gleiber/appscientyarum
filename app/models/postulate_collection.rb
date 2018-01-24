class PostulateCollection < ActiveRecord::Base
	include CodeGenerator
  belongs_to :postulate
  belongs_to :collection
end
