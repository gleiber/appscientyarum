class CreateProgramCalifications < ActiveRecord::Migration[5.0]
  def change
    create_table :program_califications do |t|
      t.integer :user_id, index: true, foreign_key: true
      t.integer :program_id, index: true, foreign_key: true
      t.string :comment
      t.integer :calification

      t.timestamps
    end
  end
end
