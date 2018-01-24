class QuestionPoll < ActiveRecord::Base
	include CodeGenerator
  belongs_to :question
  belongs_to :poll
end
