class CreateEmails < ActiveRecord::Migration
  def change
    create_table :emails do |t|
      t.string :descripcion
      t.references :postgraduate_coordination, index: true, foreign_key: true
      t.string :codigo

      t.timestamps null: false
    end
  end
end
