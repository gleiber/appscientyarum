class CreateSurveyResponses < ActiveRecord::Migration[5.0]
  def change
    create_table :survey_responses do |t|
      t.references :poll, foreign_key: true
      t.string :sexo
      t.string :edad

      t.timestamps
    end
  end
end
