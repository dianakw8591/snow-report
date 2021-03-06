# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_03_05_165150) do

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "data", force: :cascade do |t|
    t.integer "station_id", null: false
    t.datetime "date"
    t.float "high_temp"
    t.float "low_temp"
    t.float "precip_accumulation"
    t.string "precip_type"
    t.float "swe"
    t.float "snow_depth"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.float "observed_temp"
    t.index ["station_id"], name: "index_data_on_station_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "name"
    t.integer "central_station_id"
    t.string "img_url"
    t.string "map_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "posts", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "location_id", null: false
    t.datetime "date"
    t.string "title"
    t.string "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["location_id"], name: "index_posts_on_location_id"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "stations", force: :cascade do |t|
    t.integer "location_id", null: false
    t.integer "elevation"
    t.float "lat"
    t.float "lng"
    t.string "name"
    t.string "triplet"
    t.integer "avg_snowpack"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["location_id"], name: "index_stations_on_location_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.integer "location_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["location_id"], name: "index_users_on_location_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "data", "stations"
  add_foreign_key "posts", "stations", column: "location_id"
  add_foreign_key "posts", "users"
  add_foreign_key "stations", "locations"
  add_foreign_key "users", "locations"
end
