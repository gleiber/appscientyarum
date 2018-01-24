class AddRequestClassLaboratoryToDefendingThesis < ActiveRecord::Migration[5.0]
  def change
    add_reference :request_class_labs, :defending_thesis, foreign_key: true
  end
end
