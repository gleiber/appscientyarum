class CreateTypePollRoles < ActiveRecord::Migration
  def change
    create_table :type_poll_roles do |t|
      t.references :type_poll, index: true, foreign_key: true
      t.references :role, index: true, foreign_key: true
      t.string :codigo

      t.timestamps null: false
    end
  end
end
