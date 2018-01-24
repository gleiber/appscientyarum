class CreatePostulateAreaInterests < ActiveRecord::Migration[5.0]
  def change
    create_table :postulate_area_interests do |t|
      t.references :area_interest, foreign_key: true
      t.references :postulate, foreign_key: true
      t.string :codigo

      t.timestamps
    end
  end
end
