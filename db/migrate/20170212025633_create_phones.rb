class CreatePhones < ActiveRecord::Migration
  def change
    create_table :phones do |t|
      t.string :numero
      t.references :postgraduate_coordination, index: true, foreign_key: true
      t.string :codigo

      t.timestamps null: false
    end
  end
end
