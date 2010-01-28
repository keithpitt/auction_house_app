class CreateScans < ActiveRecord::Migration
  def self.up
    create_table :scans do |t|
      t.integer :character_id
      t.timestamp :scanned_at
      t.timestamps
    end
  end

  def self.down
    drop_table :scans
  end
end
