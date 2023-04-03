# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_04_03_160412) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cards", force: :cascade do |t|
    t.string "number", null: false
    t.decimal "amount", precision: 5, scale: 2, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "line_stations", force: :cascade do |t|
    t.bigint "train_line_id", null: false
    t.bigint "station_id", null: false
    t.bigint "next_station_id"
    t.bigint "previous_station_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["next_station_id"], name: "index_line_stations_on_next_station_id"
    t.index ["previous_station_id"], name: "index_line_stations_on_previous_station_id"
    t.index ["station_id"], name: "index_line_stations_on_station_id"
    t.index ["train_line_id"], name: "index_line_stations_on_train_line_id"
  end

  create_table "rides", force: :cascade do |t|
    t.bigint "origin_id"
    t.bigint "destination_id"
    t.bigint "card_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["card_id"], name: "index_rides_on_card_id"
    t.index ["destination_id"], name: "index_rides_on_destination_id"
    t.index ["origin_id"], name: "index_rides_on_origin_id"
  end

  create_table "stations", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "train_lines", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "fare", precision: 5, scale: 2
  end

  add_foreign_key "line_stations", "stations"
  add_foreign_key "line_stations", "stations", column: "next_station_id"
  add_foreign_key "line_stations", "stations", column: "previous_station_id"
  add_foreign_key "line_stations", "train_lines"
  add_foreign_key "rides", "cards"
  add_foreign_key "rides", "stations", column: "destination_id"
  add_foreign_key "rides", "stations", column: "origin_id"
end
