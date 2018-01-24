class CreateReasons < ActiveRecord::Migration
  def change
    create_table :reasons do |t|
      t.string :descipcion
      t.references :type_reason, index: true, foreign_key: true
      t.references :request_class_lab, index: true, foreign_key: true
      t.string :codigo

      t.timestamps null: false
    end
  end
end
