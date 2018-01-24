class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :descripcion
      t.string :codigo

      t.timestamps null: false
    end
  end
end
