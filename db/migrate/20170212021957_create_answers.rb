class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :descripcion
      t.string :codigo

      t.timestamps null: false
    end
  end
end
