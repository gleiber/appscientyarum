class Keyword < ActiveRecord::Base
	include CodeGenerator
  belongs_to :thesis
end
