class CreateEvaCommProjs < ActiveRecord::Migration
  def change
    create_table :eva_comm_projs do |t|
      t.string :principal_1
      t.string :principal_2
      t.string :principal_3
      t.string :suplente_1
      t.string :coordinador
      t.references :project, index: true, foreign_key: true
      t.string :codigo

      t.timestamps null: false
    end
  end
end
