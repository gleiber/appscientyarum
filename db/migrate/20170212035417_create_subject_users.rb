class CreateSubjectUsers < ActiveRecord::Migration
  def change
    create_table :subject_users do |t|
      t.references :subject, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.string :codigo

      t.timestamps null: false
    end
  end
end
