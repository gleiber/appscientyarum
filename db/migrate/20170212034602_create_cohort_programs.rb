class CreateCohortPrograms < ActiveRecord::Migration[5.0]
  def change
    create_table :cohort_programs do |t|
      t.references :cohort, foreign_key: true
      t.references :program, foreign_key: true

      t.timestamps
    end
  end
end
