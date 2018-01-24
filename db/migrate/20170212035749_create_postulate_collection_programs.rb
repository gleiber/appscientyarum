class CreatePostulateCollectionPrograms < ActiveRecord::Migration
  def change
    create_table :postulate_collection_programs do |t|
      t.references :postulate, index: true, foreign_key: true
      t.references :collection_program, index: true, foreign_key: true
      t.boolean :estado
      t.string :codigo

      t.timestamps null: false
    end
  end
end
