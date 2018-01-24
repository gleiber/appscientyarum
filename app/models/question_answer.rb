class QuestionAnswer < ActiveRecord::Base
	include CodeGenerator
  belongs_to :question
  belongs_to :answer
end
