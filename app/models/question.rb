class Question < ActiveRecord::Base
	include CodeGenerator
	has_many :question_answer
	has_many :answers, through: :question_answer

	has_many :question_poll
  	has_many :polls, through: :question_poll
  	has_many :survey_response_questions
end
