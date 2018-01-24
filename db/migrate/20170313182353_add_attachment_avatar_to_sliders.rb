class AddAttachmentAvatarToSliders < ActiveRecord::Migration[5.0]
  def self.up
    change_table :sliders do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :sliders, :avatar
  end
end
