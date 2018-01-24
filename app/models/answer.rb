class Answer < ActiveRecord::Base
	include CodeGenerator
	has_many :question_answer
	has_many :questions , through: :question_answer
	
	has_many :survey_response_questions

end
