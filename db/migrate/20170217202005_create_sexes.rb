class CreateSexes < ActiveRecord::Migration[5.0]
  def change
    create_table :sexes do |t|
      t.string :descripcion

      t.timestamps
    end
  end
end
