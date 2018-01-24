class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.date :fecha
      t.time :hora_inicio
      t.time :hora_final
      t.string :codigo

      t.timestamps null: false
    end
  end
end
