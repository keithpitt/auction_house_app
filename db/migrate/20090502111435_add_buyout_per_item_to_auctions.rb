class AddBuyoutPerItemToAuctions < ActiveRecord::Migration
  def self.up
    add_column :auctions, :buyout_per_item, :int8
  end

  def self.down
    remove_column :auctions, :buyout_per_item
  end
end
