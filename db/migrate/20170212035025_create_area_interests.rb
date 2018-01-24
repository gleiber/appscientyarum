class CreateAreaInterests < ActiveRecord::Migration
  def change
    create_table :area_interests do |t|
      t.references :line_investigation, index: true, foreign_key: true
      t.string :descripcion
      t.string :codigo

      t.timestamps null: false
    end
  end
end
