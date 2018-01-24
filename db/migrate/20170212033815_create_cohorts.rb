class CreateCohorts < ActiveRecord::Migration
  def change
    create_table :cohorts do |t|
      t.string :descripcion
      t.string :codigo

      t.timestamps null: false
    end
  end
end
