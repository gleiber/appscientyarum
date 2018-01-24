class CreateCohortPeriods < ActiveRecord::Migration
  def change
    create_table :cohort_periods do |t|
      t.references :cohort_program, index: true, foreign_key: true
      t.references :period, index: true, foreign_key: true
      t.references :regimen_duration, index: true, foreign_key: true
      
      t.string :codigo

      t.timestamps null: false
    end
  end
end
