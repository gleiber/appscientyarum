class AddSolicitanteToEvent < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :solicitante, :string
  end
end
