class Opinion < ActiveRecord::Base
	include CodeGenerator
  belongs_to :user
  belongs_to :type_opinion
end
