class CreateTypePolls < ActiveRecord::Migration
  def change
    create_table :type_polls do |t|
      t.string :descripcion
      t.string :codigo

      t.timestamps null: false
    end
  end
end
