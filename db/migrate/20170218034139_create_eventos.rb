class CreateEventos < ActiveRecord::Migration[5.0]
  def change
    create_table :eventos do |t|
      t.string :tittle
      t.string :event

      t.timestamps
    end
  end
end
