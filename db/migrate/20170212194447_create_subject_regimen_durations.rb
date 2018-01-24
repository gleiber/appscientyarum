class CreateSubjectRegimenDurations < ActiveRecord::Migration[5.0]
  def change
    create_table :subject_regimen_durations do |t|
      t.references :regimen_duration, foreign_key: true
      t.references :subject, foreign_key: true
      t.timestamps
    end
  end
end
