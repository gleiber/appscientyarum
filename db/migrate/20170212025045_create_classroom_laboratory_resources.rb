class CreateClassroomLaboratoryResources < ActiveRecord::Migration
  def change
    create_table :classroom_laboratory_resources do |t|
      t.references :resource, index: true, foreign_key: true
      t.references :classroom_laboratory, index: true, foreign_key: true
      t.references :state, index: true, foreign_key: true
      t.string :codigo

      t.timestamps null: false
    end
  end
end
