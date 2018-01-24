class AddStartEndToRequestClassLab < ActiveRecord::Migration[5.0]
  def change
    add_column :request_class_labs, :start, :string
    add_column :request_class_labs, :end, :string
        add_column :request_class_labs, :day, :string
  end
end


