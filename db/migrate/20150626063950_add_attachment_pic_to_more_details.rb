class AddAttachmentPicToMoreDetails < ActiveRecord::Migration
  def self.up
    change_table :more_details do |t|
      t.attachment :pic
    end
  end

  def self.down
    remove_attachment :more_details, :pic
  end
end
