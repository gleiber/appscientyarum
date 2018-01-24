class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
  	  t.string :titulo	
      t.date :fecha_hasta
      t.date :fecha_desde
      t.date :fecha_inscripcion
      t.references :program, index: true, foreign_key: true
      t.string :codigo

      t.timestamps null: false
    end
  end
end
