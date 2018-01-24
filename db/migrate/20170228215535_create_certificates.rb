class CreateCertificates < ActiveRecord::Migration[5.0]
  def change
    create_table :certificates do |t|
     t.references :user, foreign_key: true
     t.references :type_certificate, foreign_key: true
	 t.references :type_status_certificate, foreign_key: true
     t.timestamps
    end
  end
end
