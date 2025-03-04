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

ActiveRecord::Schema[7.2].define(version: 2025_03_03_134157) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "aircrafts", force: :cascade do |t|
    t.string "icao24"
    t.string "acars"
    t.string "adsb"
    t.string "built"
    t.string "categoryDescription"
    t.string "country"
    t.string "engines"
    t.string "firstFlightDate"
    t.string "firstSeen"
    t.string "icaoAircraftClass"
    t.string "lineNumber"
    t.string "manufacturerIcao"
    t.string "manufacturerName"
    t.string "model"
    t.string "modes"
    t.string "nextReg"
    t.string "notes"
    t.string "operator"
    t.string "operatorCallsign"
    t.string "operatorIata"
    t.string "operatorIcao"
    t.string "owner"
    t.string "prevReg"
    t.string "regUntil"
    t.boolean "registered"
    t.string "registration"
    t.string "selCal"
    t.string "serialNumber"
    t.string "status"
    t.string "typecode"
    t.string "vdl"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "airports", force: :cascade do |t|
    t.string "ident"
    t.string "airport_type"
    t.string "name"
    t.float "latitude_deg"
    t.float "longitude_deg"
    t.integer "elevation_ft"
    t.string "continent"
    t.string "iso_country"
    t.string "region_name"
    t.string "iso_region"
    t.string "local_region"
    t.string "municipality"
    t.boolean "scheduled_service"
    t.string "gps_code"
    t.string "iata_code"
    t.string "local_code"
    t.string "home_link"
    t.string "wikipedia_link"
    t.string "keywords"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "alerts", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "flight_id", null: false
    t.string "alert_type"
    t.text "message"
    t.boolean "read", default: false
    t.boolean "sent", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["flight_id"], name: "index_alerts_on_flight_id"
    t.index ["user_id"], name: "index_alerts_on_user_id"
  end

  create_table "flights", force: :cascade do |t|
    t.string "flight_code"
    t.datetime "departure_time"
    t.datetime "arrival_time"
    t.string "origin_airport_id"
    t.string "destination_airport_id"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "historiques", force: :cascade do |t|
    t.integer "aircraft_id"
    t.integer "user_id"
    t.string "action"
    t.datetime "timestamp"
    t.text "details"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["aircraft_id"], name: "index_historiques_on_aircraft_id"
    t.index ["user_id"], name: "index_historiques_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vol_favoris", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "flight_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["flight_id"], name: "index_vol_favoris_on_flight_id"
    t.index ["user_id"], name: "index_vol_favoris_on_user_id"
  end

  add_foreign_key "alerts", "flights"
  add_foreign_key "alerts", "users"
  add_foreign_key "historiques", "aircrafts"
  add_foreign_key "historiques", "users"
  add_foreign_key "vol_favoris", "flights"
  add_foreign_key "vol_favoris", "users"
end
