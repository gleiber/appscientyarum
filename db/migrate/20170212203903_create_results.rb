class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.text :descripcion
      t.references :thesis, index: true, foreign_key: true
      t.string :codigo

      t.timestamps null: false
    end
  end
end
