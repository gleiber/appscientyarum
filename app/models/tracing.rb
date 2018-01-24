class Tracing < ActiveRecord::Base
	include CodeGenerator
  belongs_to :project
  has_many :news
end
