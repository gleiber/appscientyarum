class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :tutor
      t.string :titulo
      t.references :user, index: true, foreign_key: true
      t.references :line_investigation, index: true, foreign_key: true
      t.string :codigo
      t.timestamps null: false
    end
  end
end
