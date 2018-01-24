class CreateRegimenDurations < ActiveRecord::Migration[5.0]
  def change
    create_table :regimen_durations do |t|
      t.references :program, foreign_key: true
      t.string :numero

      t.timestamps
    end
  end
end
