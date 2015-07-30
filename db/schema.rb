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

ActiveRecord::Schema.define(version: 20150730133933) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "addresses", force: :cascade do |t|
    t.string   "city"
    t.string   "street"
    t.string   "zip_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "apartments", force: :cascade do |t|
    t.string   "door_number"
    t.integer  "bedroom_count"
    t.integer  "bathroom_count"
    t.text     "room_description"
    t.integer  "floor"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "name"
    t.integer  "address_id"
    t.integer  "min_guests"
    t.integer  "max_guests"
    t.decimal  "day_price"
    t.decimal  "week_price"
    t.boolean  "active"
    t.integer  "owner_id"
  end

  add_index "apartments", ["address_id"], name: "index_apartments_on_address_id", using: :btree
  add_index "apartments", ["owner_id"], name: "index_apartments_on_owner_id", using: :btree

end
