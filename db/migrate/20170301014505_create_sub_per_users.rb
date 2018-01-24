class CreateSubPerUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :sub_per_users do |t|
      t.string :nota
      t.references :user, foreign_key: true
      t.references :coh_per_sub_u, foreign_key: true

      t.timestamps
    end
  end
end
