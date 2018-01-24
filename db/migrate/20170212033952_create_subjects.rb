class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.string :descripcion
      t.string :codigo
      t.string :unidades_credito	
      t.timestamps null: false
    end
  end
end
