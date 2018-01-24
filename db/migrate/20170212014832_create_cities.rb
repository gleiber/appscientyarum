class CreateCities < ActiveRecord::Migration[5.0]
  def change
    create_table :cities do |t|
      t.string :descripcion
      t.references :estado, foreign_key: true
      t.string :codigo

      t.timestamps
    end
  end
end
