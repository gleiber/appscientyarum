class CreateGraduateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :graduate_profiles do |t|
      t.string :descripcion
      t.references :program, index: true, foreign_key: true
      t.timestamps
    end
  end
end
