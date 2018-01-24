class CreateSocialWidgets < ActiveRecord::Migration[5.0]
  def change
    create_table :social_widgets do |t|
      t.string :facebook
      t.string :twitter
      t.string :instagram
      t.string :linkedin

      t.timestamps
    end
  end
end
