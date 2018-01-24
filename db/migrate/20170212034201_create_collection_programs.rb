class CreateCollectionPrograms < ActiveRecord::Migration
  def change
    create_table :collection_programs do |t|
      t.references :program, index: true, foreign_key: true
      t.references :collection, index: true, foreign_key: true
      t.string :codigo

      t.timestamps null: false
    end
  end
end
