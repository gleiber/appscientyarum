class CreateBlocks < ActiveRecord::Migration[5.0]
  def change
    create_table :blocks do |t|
      t.string :desde
      t.string :hasta
      t.string :codigo      
      t.timestamps
    end
  end
end
