class CreateKeywords < ActiveRecord::Migration
  def change
    create_table :keywords do |t|
      t.string :descripcion
      t.references :thesis, index: true, foreign_key: true
      t.string :codigo

      t.timestamps null: false
    end
  end
end
