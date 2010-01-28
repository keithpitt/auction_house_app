class AddScannedAtToScanFiles < ActiveRecord::Migration
  def self.up
    add_column :scan_files, :scanned_at, :timestamp
  end

  def self.down
    remove_column :scan_files, :scanned_at
  end
end
