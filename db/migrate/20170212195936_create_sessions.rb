class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.references :classroom_laboratory_schedule, index: true, foreign_key: true
      t.references :coh_per_sub_u, index: true, foreign_key: true
      t.string :codigo

      t.timestamps null: false
    end
  end
end
