class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.string :descripcion
      t.string :codigo

      t.timestamps null: false
    end
  end
end
