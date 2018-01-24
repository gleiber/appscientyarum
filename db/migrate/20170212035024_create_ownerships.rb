class CreateOwnerships < ActiveRecord::Migration
  def change
    create_table :ownerships do |t|
      t.references :academic_degree, index: true, foreign_key: true
      t.references :speciality, index: true, foreign_key: true
      t.string :codigo

      t.timestamps null: false
    end
  end
end
