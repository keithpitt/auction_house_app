class AddScanIdToAuctions < ActiveRecord::Migration
  def self.up
  add_column :auctions, :scan_id, :integer
  end
  
  def self.down
  remove_column :auctions, :scan_id
  end
end
