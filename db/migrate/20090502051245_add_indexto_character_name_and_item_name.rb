class AddIndextoCharacterNameAndItemName < ActiveRecord::Migration
  def self.up
    add_index :characters, :name
    add_index :items, :name
  end

  def self.down
    remove_index :characters, :name
    remove_index :items, :name
  end
end
