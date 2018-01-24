class CreatePolls < ActiveRecord::Migration
  def change
    create_table :polls do |t|
      t.string :descripcion
      t.references :type_poll, index: true, foreign_key: true
      t.string :codigo
      t.string :estatus

      t.timestamps null: false
    end
  end
end
