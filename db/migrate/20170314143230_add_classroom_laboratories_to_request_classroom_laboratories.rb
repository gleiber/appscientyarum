class AddClassroomLaboratoriesToRequestClassroomLaboratories < ActiveRecord::Migration[5.0]
  def change
    add_reference :request_class_labs, :classroom_laboratory, foreign_key: true
  end
end
