class CreateQuestionPolls < ActiveRecord::Migration
  def change
    create_table :question_polls do |t|
      t.references :question, index: true, foreign_key: true
      t.references :poll, index: true, foreign_key: true
      t.string :codigo

      t.timestamps null: false
    end
  end
end
