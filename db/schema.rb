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

ActiveRecord::Schema.define(version: 20150117202442) do

  create_table "furnitures", force: true do |t|
    t.string   "title"
    t.string   "tag"
    t.string   "picture1"
    t.string   "picture2"
    t.string   "picture3"
    t.string   "picture4"
    t.float    "price"
    t.text     "description"
    t.string   "email"
    t.string   "phone"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "address"
    t.float    "oldness"
  end

  add_index "furnitures", ["user_id"], name: "index_furnitures_on_user_id"

  create_table "furnitures_watchlists", force: true do |t|
    t.integer "watchlist_id"
    t.integer "furniture_id"
  end

  add_index "furnitures_watchlists", ["furniture_id"], name: "index_furnitures_watchlists_on_furniture_id"
  add_index "furnitures_watchlists", ["watchlist_id"], name: "index_furnitures_watchlists_on_watchlist_id"

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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "phone"
    t.string   "name"
    t.string   "address"
    t.string   "introduction"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "watchlists", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "watchlists", ["user_id"], name: "index_watchlists_on_user_id"

end
