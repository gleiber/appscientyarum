class AddSexToPostulates < ActiveRecord::Migration[5.0]
  def change
  	add_reference :postulates, :sex, foreign_key: true
  	add_reference :postulates, :civil_status, foreign_key: true
  end
end
