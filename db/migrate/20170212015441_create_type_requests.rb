class CreateTypeRequests < ActiveRecord::Migration
  def change
    create_table :type_requests do |t|
      t.string :descripcion
      t.string :codigo

      t.timestamps null: false
    end
  end
end
