class CreateProjectAreaInterests < ActiveRecord::Migration[5.0]
  def change
    create_table :project_area_interests do |t|
      t.references :project, foreign_key: true
      t.references :area_interest, foreign_key: true

      t.timestamps
    end
  end
end
