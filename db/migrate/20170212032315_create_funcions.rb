class CreateFuncions < ActiveRecord::Migration
  def change
    create_table :funcions do |t|
      t.string :descripcion
      t.string :id_padre
      t.string :estatus
      t.string :url
      t.string :id_funcion
      t.string :codigo
      t.string :icon

      t.timestamps null: false
    end
  end
end
