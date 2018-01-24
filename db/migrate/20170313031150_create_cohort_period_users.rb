class CreateCohortPeriodUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :cohort_period_users do |t|
      t.references :cohort_period, foreign_key: true
      t.references :cohort_user, foreign_key: true

      t.timestamps
    end
  end
end
