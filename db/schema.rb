# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110206143818) do

  create_table "accounts", :force => true do |t|
    t.string   "email",                               :default => "", :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "", :null => false
    t.string   "password_salt",                       :default => "", :null => false
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.integer  "failed_attempts",                     :default => 0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "accounts", ["confirmation_token"], :name => "index_accounts_on_confirmation_token", :unique => true
  add_index "accounts", ["email"], :name => "index_accounts_on_email", :unique => true
  add_index "accounts", ["reset_password_token"], :name => "index_accounts_on_reset_password_token", :unique => true
  add_index "accounts", ["unlock_token"], :name => "index_accounts_on_unlock_token", :unique => true

  create_table "players", :force => true do |t|
    t.string   "username"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "players", ["username"], :name => "index_players_on_username"

  create_table "server_properties", :force => true do |t|
    t.integer  "server_id"
    t.string   "level_name",     :default => "world"
    t.integer  "max_players",    :default => 20
    t.string   "server_ip"
    t.integer  "server_port",    :default => 25565
    t.boolean  "online_mode",    :default => true
    t.boolean  "hellworld",      :default => false
    t.boolean  "spawn_monsters", :default => true
    t.boolean  "spawn_animals",  :default => true
    t.boolean  "pvp",            :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "servers", :force => true do |t|
    t.integer  "account_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "servers", ["account_id"], :name => "index_servers_on_account_id"

end
