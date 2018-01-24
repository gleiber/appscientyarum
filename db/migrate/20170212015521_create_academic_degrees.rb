class CreateAcademicDegrees < ActiveRecord::Migration
  def change
    create_table :academic_degrees do |t|
      t.string :descripcion
      t.string :codigo

      t.timestamps null: false
    end
  end
end
