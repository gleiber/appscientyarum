class CreateStates < ActiveRecord::Migration
  def change
    create_table :states do |t|
      t.string :descripcion
      t.string :codigo

      t.timestamps null: false
    end
  end
end
