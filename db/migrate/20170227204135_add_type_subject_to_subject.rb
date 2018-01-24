class AddTypeSubjectToSubject < ActiveRecord::Migration[5.0]
  def change
    add_reference :subjects, :type_subject, foreign_key: true
  end
end
