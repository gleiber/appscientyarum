class CreatePostgraduateCoordinations < ActiveRecord::Migration
  def change
    create_table :postgraduate_coordinations do |t|
      t.text :descripcion
      t.text :mision
      t.text :vision
      t.string :direccion
      t.references :city, index: true, foreign_key: true
      t.string :codigo


      t.timestamps null: false
    end
  end
end
