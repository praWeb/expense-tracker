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

ActiveRecord::Schema.define(version: 20170310160627) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "beds", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "bed_type"
    t.integer  "bed_count"
    t.integer  "in_use"
  end

  create_table "chairs", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customers", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lamps", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "records", force: :cascade do |t|
    t.string   "title"
    t.date     "date"
    t.float    "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "room_allocations", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rooms", force: :cascade do |t|
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "number"
    t.boolean  "occupied"
    t.integer  "bed_count"
    t.integer  "bed_ids",     default: [],              array: true
    t.integer  "chair_count"
    t.integer  "chair_ids",   default: [],              array: true
    t.integer  "table_count"
    t.integer  "table_ids",   default: [],              array: true
    t.integer  "lamps_count"
    t.integer  "lamp_ids",    default: [],              array: true
    t.string   "room_type"
  end

  create_table "table_room_beds", force: :cascade do |t|
    t.integer  "room_id",    null: false
    t.integer  "bed_id",     null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bed_id"], name: "index_table_room_beds_on_bed_id", using: :btree
    t.index ["room_id"], name: "index_table_room_beds_on_room_id", using: :btree
  end

  create_table "tables", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "table_room_beds", "beds"
  add_foreign_key "table_room_beds", "rooms"
end
