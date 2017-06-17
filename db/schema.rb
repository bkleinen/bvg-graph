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

ActiveRecord::Schema.define(version: 20170617135435) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "agencies", force: :cascade do |t|
    t.integer "agency_identifier"
    t.string "agency_name"
    t.string "agency_url"
    t.string "agency_timezone"
    t.string "agency_lang"
    t.string "agency_phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "calendar_dates", force: :cascade do |t|
    t.integer "service_identifier"
    t.date "date"
    t.string "exception_type"
    t.string "integer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "calendars", force: :cascade do |t|
    t.string "service_identifier"
    t.integer "monday"
    t.integer "tuesday"
    t.integer "wednesday"
    t.integer "thursday"
    t.integer "friday"
    t.integer "saturday"
    t.integer "sunday"
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "routes", force: :cascade do |t|
    t.integer "route_identifier"
    t.integer "agency_identifier"
    t.string "route_short_name"
    t.string "route_long_name"
    t.integer "route_type"
    t.string "route_color"
    t.string "route_text_color"
    t.string "route_desc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stop_times", force: :cascade do |t|
    t.integer "trip_identifier"
    t.time "arrival_time"
    t.time "departure_time"
    t.string "stop_identifier"
    t.integer "stop_sequence"
    t.integer "pickup_type"
    t.integer "drop_off_type"
    t.string "stop_headsign"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trips", force: :cascade do |t|
    t.string "route_identifier"
    t.string "service_id"
    t.string "trip_id"
    t.string "trip_headsign"
    t.string "trip_short_name"
    t.integer "direction_identifier"
    t.integer "block_identifier"
    t.integer "shape_identifier"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
