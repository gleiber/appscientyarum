class AddAttachmentAvatarToPrograms < ActiveRecord::Migration[5.0]
  def self.up
    change_table :programs do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :programs, :avatar
  end
end
