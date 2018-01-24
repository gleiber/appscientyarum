class CreateTypeReqResps < ActiveRecord::Migration
  def change
    create_table :type_req_resps do |t|
      t.string :descripcion
      t.string :codigo

      t.timestamps null: false
    end
  end
end
