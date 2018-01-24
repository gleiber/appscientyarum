class CreateOfferUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :offer_users do |t|
      t.references :offer, foreign_key: true
      t.references :user, foreign_key: true
      t.string :codigo

      t.timestamps
    end
  end
end
