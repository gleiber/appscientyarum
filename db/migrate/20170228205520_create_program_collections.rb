class CreateProgramCollections < ActiveRecord::Migration[5.0]
  def change
    create_table :program_collections do |t|
      t.references :program, foreign_key: true
      t.references :collection, foreign_key: true

      t.timestamps
    end
  end
end
