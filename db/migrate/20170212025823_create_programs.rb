class CreatePrograms < ActiveRecord::Migration
  def change
    create_table :programs do |t|
      t.string :titulo
      t.text :descripcion
      t.string :duracion
      t.string :grado_egresado
      t.references :regimen_study, index: true, foreign_key: true
      t.references :modality, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.string :codigo

      t.timestamps null: false
    end
  end
end