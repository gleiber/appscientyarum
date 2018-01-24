class CreateScheduleCohortPeriods < ActiveRecord::Migration
  def change
    create_table :schedule_cohort_periods do |t|
      t.references :schedule, index: true, foreign_key: true
      t.references :cohort_period, index: true, foreign_key: true
      t.string :codigo

      t.timestamps null: false
    end
  end
end
