# encoding: UTF-8
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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160702042734) do

  create_table "comments", force: true do |t|
    t.text     "text",        null: false
    t.integer  "user_id",     null: false
    t.integer  "playlist_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["playlist_id"], name: "index_comments_on_playlist_id"
  add_index "comments", ["user_id"], name: "index_comments_on_user_id"

  create_table "links", force: true do |t|
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "links_playlists", id: false, force: true do |t|
    t.integer "playlist_id", null: false
    t.integer "link_id",     null: false
  end

  create_table "playlists", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "user_id"
    t.boolean  "private"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "playlists", ["user_id"], name: "index_playlists_on_user_id"

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "role"
    t.string   "provider"
    t.string   "uid"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
