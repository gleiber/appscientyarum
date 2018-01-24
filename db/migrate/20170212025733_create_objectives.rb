class CreateObjectives < ActiveRecord::Migration
  def change
    create_table :objectives do |t|
      t.text :descripcion
      t.references :postgraduate_coordination, index: true, foreign_key: true
      t.string :codigo

      t.timestamps null: false
    end
  end
end
