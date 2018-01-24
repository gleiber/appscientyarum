class CreateTypeContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :type_contacts do |t|
      t.string :descripcion
      t.string :codigo

      t.timestamps
    end
  end
end
