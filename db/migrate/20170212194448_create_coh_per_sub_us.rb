class CreateCohPerSubUs < ActiveRecord::Migration
  def change
    create_table :coh_per_sub_us do |t|
      t.string :title
      t.text :description
      t.datetime :start
      t.datetime :end
      t.string :allDay
      t.references :cohort_period, index: true, foreign_key: true
      t.references :subject_user, index: true, foreign_key: true
      t.references :schedule_cohort_period, index: true, foreign_key: true
      t.references :subject_regimen_duration, index: true, foreign_key: true
      t.string :codigo

      t.timestamps null: false
    end
  end
end
