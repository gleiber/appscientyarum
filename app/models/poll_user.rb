class PollUser < ActiveRecord::Base
	include CodeGenerator
  belongs_to :user
  belongs_to :poll
end
