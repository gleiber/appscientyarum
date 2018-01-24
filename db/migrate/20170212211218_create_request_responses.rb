class CreateRequestResponses < ActiveRecord::Migration
  def change
    create_table :request_responses do |t|
      t.references :type_req_resp, index: true, foreign_key: true
      t.string :codigo

      t.timestamps null: false
    end
  end
end
