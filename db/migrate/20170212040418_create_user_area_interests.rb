class CreateUserAreaInterests < ActiveRecord::Migration
  def change
    create_table :user_area_interests do |t|
      t.references :area_interest, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.string :codigo

      t.timestamps null: false
    end
  end
end
