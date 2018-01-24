class CreateContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :contacts do |t|
      t.string :nombre
      t.string :telefono
      t.string :email
      t.string :descripcion
      t.references :type_contact, foreign_key: true
      t.references :contact_about, foreign_key: true
      t.references :program, foreign_key: true
      t.references :area_interest, index: true, foreign_key: true
      t.string :codigo

      t.timestamps
    end
  end
end
