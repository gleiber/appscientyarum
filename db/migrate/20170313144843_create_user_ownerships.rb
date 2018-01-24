class CreateUserOwnerships < ActiveRecord::Migration[5.0]
  def change
    create_table :user_ownerships do |t|
      t.references :user, foreign_key: true
      t.references :ownership, foreign_key: true

      t.timestamps
    end
  end
end
