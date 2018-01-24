class CreateLineInvestigations < ActiveRecord::Migration
  def change
    create_table :line_investigations do |t|
      t.string :descripcion
      t.references :program, index: true, foreign_key: true
      t.string :codigo

      t.timestamps null: false
    end
  end
end
