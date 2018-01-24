class CreateRoleFuncions < ActiveRecord::Migration
  def change
    create_table :role_funcions do |t|
      t.references :role, index: true, foreign_key: true
      t.references :funcion, index: true, foreign_key: true
      t.string :codigo

      t.timestamps null: false
    end
  end
end
