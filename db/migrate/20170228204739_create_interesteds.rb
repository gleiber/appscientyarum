class CreateInteresteds < ActiveRecord::Migration[5.0]
  def change
    create_table :interesteds do |t|
      t.string :nombre
      t.string :email
      t.string :telefono
      t.references :program, foreign_key: true
      t.references :area_interest, foreign_key: true
      t.string :descripcion
      t.references :detail, foreign_key: true
      t.references :find_out, foreign_key: true
      t.references :why_dcyt, foreign_key: true

      t.timestamps
    end
  end
end
