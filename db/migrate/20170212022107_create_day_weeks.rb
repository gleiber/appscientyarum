class CreateDayWeeks < ActiveRecord::Migration[5.0]
  def change
    create_table :day_weeks do |t|
      t.string :descripcion
      t.string :codigo

      t.timestamps
    end
  end
end
