class CreateCollections < ActiveRecord::Migration
  def change
    create_table :collections do |t|
      t.string :descripcion
      t.string :codigo

      t.timestamps null: false
    end
  end
end
