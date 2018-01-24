class CreateDetails < ActiveRecord::Migration
  def change
    create_table :details do |t|
      t.text :descripcion
      t.string :codigo

      t.timestamps null: false
    end
  end
end
