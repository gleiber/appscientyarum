class CreateCivilStatuses < ActiveRecord::Migration[5.0]
  def change
    create_table :civil_statuses do |t|
      t.string :descripcion

      t.timestamps
    end
  end
end
