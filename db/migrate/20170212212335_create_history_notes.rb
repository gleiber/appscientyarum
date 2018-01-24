class CreateHistoryNotes < ActiveRecord::Migration
  def change
    create_table :history_notes do |t|
      t.string :cohorte
      t.string :periodo
      t.string :participante
      t.string :materia
      t.string :nota
      t.string :codigo

      t.timestamps null: false
    end
  end
end
