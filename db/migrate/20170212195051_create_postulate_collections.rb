class CreatePostulateCollections < ActiveRecord::Migration
  def change
    create_table :postulate_collections do |t|
      t.references :postulate, index: true, foreign_key: true
      t.references :collection, index: true, foreign_key: true
      t.string :codigo

      t.timestamps null: false
    end
  end
end
