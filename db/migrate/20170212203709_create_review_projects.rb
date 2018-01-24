class CreateReviewProjects < ActiveRecord::Migration
  def change
    create_table :review_projects do |t|
      t.references :project, index: true, foreign_key: true
      t.references :type_review, index: true, foreign_key: true
      t.string :codigo
      t.string :descripcion

      t.timestamps null: false
    end
  end
end
