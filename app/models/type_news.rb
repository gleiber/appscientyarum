class TypeNews < ActiveRecord::Base
	include CodeGenerator
	has_many :news
end
