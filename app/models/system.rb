class System < ActiveRecord::Base
	include CodeGenerator
	has_many :sliders
    has_many :funcions
end
