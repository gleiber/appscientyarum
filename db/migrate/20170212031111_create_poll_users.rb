class CreatePollUsers < ActiveRecord::Migration
  def change
    create_table :poll_users do |t|
      t.references :user, index: true, foreign_key: true
      t.references :poll, index: true, foreign_key: true
      t.string :codigo

      t.timestamps null: false
    end
  end
end
