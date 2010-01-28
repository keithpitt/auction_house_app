class CreateScanFiles < ActiveRecord::Migration
  def self.up
    create_table :scan_files do |t|
      t.integer :user_id
      t.text :scan_contents
      t.timestamps
    end
  end

  def self.down
    drop_table :scan_files
  end
end
