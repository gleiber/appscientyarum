class AddActivadotoPoll < ActiveRecord::Migration[5.0]
  def change
  	add_column :polls, :activado, :boolean
  end
end