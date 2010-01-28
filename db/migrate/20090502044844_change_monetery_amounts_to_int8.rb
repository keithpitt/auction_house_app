class ChangeMoneteryAmountsToInt8 < ActiveRecord::Migration
  def self.up
    change_column :auctions, :buyout, :int8
    change_column :auctions, :current_bid, :int8
    change_column :auctions, :orig_bid, :int8
  end

  def self.down
    change_column :auctions, :buyout, :integer
    change_column :auctions, :current_bid, :integer
    change_column :auctions, :orig_bid, :integer
  end
end
