class CreateProgramSubjects < ActiveRecord::Migration[5.0]
  def change
    create_table :program_subjects do |t|
      t.references :subject, foreign_key: true
      t.references :program, foreign_key: true

      t.timestamps
    end
  end
end
