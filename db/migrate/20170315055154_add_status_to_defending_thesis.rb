class AddStatusToDefendingThesis < ActiveRecord::Migration[5.0]
  def change
    add_column :request_class_labs, :status, :string, default: 0
  end
end
