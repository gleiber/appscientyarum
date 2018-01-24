class DayWeek < ApplicationRecord
	include CodeGenerator
	validates :descripcion, presence:  {case_sensitive: false}
end
