class CreateTracings < ActiveRecord::Migration
  def change
    create_table :tracings do |t|
      t.references :project, index: true, foreign_key: true
      t.string :descripcion
      t.string :codigo
      t.references :thesis, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
