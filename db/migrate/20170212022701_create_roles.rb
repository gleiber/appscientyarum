class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :descripcion
      t.string :estado
      t.string :codigo

      t.timestamps null: false
    end
  end
end
