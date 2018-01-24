class Estado < ApplicationRecord
	include CodeGenerator
	has_many :cities
end
