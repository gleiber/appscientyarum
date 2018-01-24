class HistoryNote < ActiveRecord::Base
	include CodeGenerator
	belongs_to :sch_per_u
end
