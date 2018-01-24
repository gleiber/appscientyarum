class CreateSchPerUs < ActiveRecord::Migration
  def change
    create_table :sch_per_us do |t|
      t.references :user, index: true, foreign_key: true
      t.references :coh_per_sub_u, index: true, foreign_key: true
      t.string :nota
      t.string :codigo

      t.timestamps null: false
    end
  end
end
