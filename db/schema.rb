# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20090503051508) do

  create_table "auctions", :force => true do |t|
    t.integer  "item_id"
    t.integer  "quantity"
    t.integer  "character_id"
    t.integer  "buyout",          :limit => 8
    t.integer  "current_bid",     :limit => 8
    t.integer  "orig_bid",        :limit => 8
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "scan_id"
    t.integer  "buyout_per_item", :limit => 8
  end

  create_table "characters", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "realm_id"
  end

  add_index "characters", ["name"], :name => "index_characters_on_name"

  create_table "items", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "items", ["name"], :name => "index_items_on_name"

  create_table "realms", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "scan_files", :force => true do |t|
    t.integer  "user_id"
    t.text     "scan_contents"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "scanned_at"
    t.integer  "size"
    t.string   "content_type"
    t.string   "filename"
    t.string   "md5_checksum"
  end

  create_table "scans", :force => true do |t|
    t.integer  "character_id"
    t.datetime "scanned_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "login",                     :limit => 40
    t.string   "name",                      :limit => 100, :default => ""
    t.string   "email",                     :limit => 100
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token",            :limit => 40
    t.datetime "remember_token_expires_at"
    t.string   "activation_code",           :limit => 40
    t.datetime "activated_at"
    t.string   "state",                                    :default => "passive"
    t.datetime "deleted_at"
    t.string   "api_key"
  end

  add_index "users", ["login"], :name => "index_users_on_login", :unique => true

end
