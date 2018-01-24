class SurveyResponse < ApplicationRecord
  belongs_to :poll
  has_many :survey_response_questions
end
