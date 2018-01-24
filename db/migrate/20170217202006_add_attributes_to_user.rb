class AddAttributesToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :username, :string   
    add_column :users, :nombre, :string
    add_column :users, :cedula, :string
    add_column :users, :direccion, :string
    add_column :users, :telefono, :string
    add_column :users, :fecha_nacimiento, :string
    add_reference :users, :role, foreign_key: {to_table: :roles}
    add_reference :users, :line_investigation, foreign_key: {to_table: :line_investigations}
    add_reference :users, :cohort_program, foreign_key: {to_table: :cohort_programs}
    add_reference :users, :sex, foreign_key: {to_table: :sexes}
    add_reference :users, :civil_status, foreign_key: {to_table: :civil_statuses}
  end
end
