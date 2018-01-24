class CreateSurveyResponseQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :survey_response_questions do |t|
      t.references :survey_response, foreign_key: true
      t.references :question, foreign_key: true
      t.references :answer, foreign_key: true

      t.timestamps
    end
  end
end
