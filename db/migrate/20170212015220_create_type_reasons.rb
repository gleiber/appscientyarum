class CreateTypeReasons < ActiveRecord::Migration
  def change
    create_table :type_reasons do |t|
      t.string :descripcion
      t.string :codigo

      t.timestamps null: false
    end
  end
end
