class CreateSystems < ActiveRecord::Migration
  def change
    create_table :systems do |t|

	  t.string :codigo
      t.timestamps null: false
    end
  end
end
