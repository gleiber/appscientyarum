class Poll < ActiveRecord::Base
	include CodeGenerator
	
  belongs_to :type_poll
  has_many :users, through: :poll_user
  has_many :question_poll
  has_many :questions, through: :question_poll
  has_many :survey_responses
  

  	#validates :type_poll_id, presence:  {case_sensitive: false ,message: "No puede estar en blanco"} 
	#validates :descripcion, presence:  {case_sensitive: false ,message: "No puede estar en blanco"}
	#validates :questions_id, presence:  {case_sensitive: false ,message: "No puede estar en blanco"}

end
