class AddAttachmentPropertiesToScanFile < ActiveRecord::Migration

  def self.up
    add_column :scan_files, :size, :integer
    add_column :scan_files, :content_type, :string
    add_column :scan_files, :filename, :string
  end

  def self.down
  end

end
