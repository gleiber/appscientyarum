class CreateSliders < ActiveRecord::Migration
  def change
    create_table :sliders do |t|
        t.string :titulo
        t.string :descripcion
    	t.string :codigo

      t.timestamps null: false
    end
  end
end

