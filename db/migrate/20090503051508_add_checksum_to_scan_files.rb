class AddChecksumToScanFiles < ActiveRecord::Migration
  def self.up
    add_column :scan_files, :md5_checksum, :string
  end

  def self.down
    remove_column :scan_files, :md5_checksum, :string
  end
end
