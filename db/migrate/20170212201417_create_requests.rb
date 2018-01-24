class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.references :type_request, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.string :codigo

      t.timestamps null: false
    end
  end
end
