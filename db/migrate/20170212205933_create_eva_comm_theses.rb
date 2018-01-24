class CreateEvaCommTheses < ActiveRecord::Migration
  def change
    create_table :eva_comm_theses do |t|
      t.string :principal_1
      t.string :principal_2
      t.string :principal_3
      t.string :suplente_1
      t.string :suplente_2
      t.string :suplente_3
      t.string :coordinador
      t.references :thesis, index: true, foreign_key: true
      t.string :codigo

      t.timestamps null: false
    end
  end
end
