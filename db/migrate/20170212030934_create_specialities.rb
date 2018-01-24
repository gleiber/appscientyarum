class CreateSpecialities < ActiveRecord::Migration
  def change
    create_table :specialities do |t|
      t.string :descripcion
      t.string :codigo

      t.timestamps null: false
    end
  end
end
