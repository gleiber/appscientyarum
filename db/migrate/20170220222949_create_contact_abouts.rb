class CreateContactAbouts < ActiveRecord::Migration[5.0]
  def change
    create_table :contact_abouts do |t|
      t.string :descripcion
      t.string :codigo

      t.timestamps
    end
  end
end
