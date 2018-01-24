class CreateNotifications < ActiveRecord::Migration[5.0]
  def change
    create_table :notifications do |t|
      t.string :tittle
      t.string :event
      t.boolean :viewed
      t.string :id_user
      t.string :id_publisher
      t.string :url

      t.timestamps
    end
  end
end
