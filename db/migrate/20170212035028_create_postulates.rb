class CreatePostulates < ActiveRecord::Migration
  def change
    create_table :postulates do |t|
      t.string :nombre
      t.string :cedula
      t.string :direccion
      t.string :sexo
      t.string :telefono
      t.string :fecha_nacimiento
      t.string :email
      t.string :estado_civil
      t.string :decision
      t.references :offer, index: true, foreign_key: true
      t.references :find_out, index: true, foreign_key: true
      t.references :city, index: true, foreign_key: true
      t.references :detail, index: true, foreign_key: true
      t.references :institution, index: true, foreign_key: true
      t.references :why_dcyt, index: true, foreign_key: true
      t.references :ownership, index: true, foreign_key: true
      t.references :area_interest, index: true, foreign_key: true
      t.string :codigo

      

      t.timestamps null: false
    end
  end
end
