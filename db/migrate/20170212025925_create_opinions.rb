class CreateOpinions < ActiveRecord::Migration
  def change
    create_table :opinions do |t|
      t.references :user, index: true, foreign_key: true
      t.references :type_opinion, index: true, foreign_key: true
      t.string :codigo

      t.timestamps null: false
    end
  end
end
