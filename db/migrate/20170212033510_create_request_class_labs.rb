
class CreateRequestClassLabs < ActiveRecord::Migration
  def change
    create_table :request_class_labs do |t|
      t.references :user, index: true, foreign_key: true
      t.references :classroom_laboratory_schedule, index: true, foreign_key: true
      t.string :codigo
      t.string :descripcion

      t.timestamps null: false
    end
  end
end