class CreatePeriods < ActiveRecord::Migration
  def change
    create_table :periods do |t|
      t.string :fecha_desde
      t.string :fecha_hasta
      t.string :codigo

      t.timestamps null: false
    end
  end
end
