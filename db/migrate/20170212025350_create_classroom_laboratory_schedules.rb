class CreateClassroomLaboratorySchedules < ActiveRecord::Migration
  def change
    create_table :classroom_laboratory_schedules do |t|
      t.references :classroom_laboratory, index: true, foreign_key: true
      t.references :schedule, index: true, foreign_key: true
      t.string :codigo

      t.timestamps null: false
    end
  end
end
