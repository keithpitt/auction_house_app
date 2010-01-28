class CreateAuctions < ActiveRecord::Migration
  def self.up
    create_table :auctions do |t|
      t.integer :item_id
      t.integer :quantity
      t.integer :character_id
      t.integer :buyout
      t.integer :current_bid
      t.integer :orig_bid
      t.timestamp :scanned_at

      t.timestamps
    end
  end

  def self.down
    drop_table :auctions
  end
end
