class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.string :titulo
      t.string :descripcion
      t.string :codigo
      t.string :estado


      t.timestamps null: false
    end
  end
end
