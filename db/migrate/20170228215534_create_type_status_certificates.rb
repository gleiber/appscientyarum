class CreateTypeStatusCertificates < ActiveRecord::Migration[5.0]
  def change
    create_table :type_status_certificates do |t|
      t.string :descripcion

      t.timestamps
    end
  end
end
