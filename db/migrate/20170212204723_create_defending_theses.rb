class CreateDefendingTheses < ActiveRecord::Migration
  def change
    create_table :defending_theses do |t|
      t.references :thesis
      t.date :fecha
      t.time :hora
      t.string :lugar
      t.string :codigo

      t.timestamps null: false
    end
  end
end
