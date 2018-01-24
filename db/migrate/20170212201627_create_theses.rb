class CreateTheses < ActiveRecord::Migration
  def change
    create_table :theses do |t|
      t.references :project, index: true, foreign_key: true
      t.string :codigo
      t.string :titulo
      t.references :user, index: true, foreign_key: true
      t.references :line_investigation, index: true, foreign_key: true
      t.string :tutor

      t.timestamps null: false
    end
  end
end
