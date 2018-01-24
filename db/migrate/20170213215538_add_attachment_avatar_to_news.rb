class AddAttachmentAvatarToNews < ActiveRecord::Migration
  def self.up
    change_table :news do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :news, :avatar
  end
end
