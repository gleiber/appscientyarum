class CreateWhyDcyts < ActiveRecord::Migration[5.0]
  def change
    create_table :why_dcyts do |t|
      t.string :descripcion
      t.string :codigo

      t.timestamps
    end
  end
end
