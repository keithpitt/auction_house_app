class RemoveScannedAtFromAuctions < ActiveRecord::Migration
  def self.up
    remove_column :auctions, :scanned_at
  end

  def self.down
  end
end
