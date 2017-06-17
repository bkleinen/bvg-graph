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

ActiveRecord::Schema.define(version: 20170617212303) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "agencies", force: :cascade do |t|
    t.string "agency_identifier"
    t.string "agency_name"
    t.string "agency_url"
    t.string "agency_timezone"
    t.string "agency_lang"
    t.string "agency_phone"
  end

  create_table "calendar_dates", force: :cascade do |t|
    t.string "service_identifier"
    t.date "date"
    t.string "exception_type"
    t.string "integer"
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
  end

  create_table "routes", force: :cascade do |t|
    t.string "route_identifier"
    t.string "agency_identifier"
    t.string "route_short_name"
    t.string "route_long_name"
    t.integer "route_type"
    t.string "route_color"
    t.string "route_text_color"
    t.string "route_desc"
  end

  create_table "shapes", force: :cascade do |t|
    t.string "shape_identifier"
    t.decimal "shape_pt_lat"
    t.decimal "shape_pt_lon"
    t.integer "shape_pt_sequence"
  end

  create_table "stop_times", force: :cascade do |t|
    t.string "trip_identifier"
    t.time "arrival_time"
    t.time "departure_time"
    t.string "stop_identifier"
    t.integer "stop_sequence"
    t.integer "pickup_type"
    t.integer "drop_off_type"
    t.string "stop_headsign"
    t.index ["trip_identifier"], name: "index_stop_times_on_trip_identifier"
  end

  create_table "stops", force: :cascade do |t|
    t.string "stop_identifier"
    t.string "stop_code"
    t.string "stop_name"
    t.string "stop_desc"
    t.decimal "stop_lat"
    t.decimal "stop_lon"
    t.integer "location_type"
    t.string "parent_station"
  end

  create_table "transfers", force: :cascade do |t|
    t.string "from_stop_identifier"
    t.string "to_stop_identifier"
    t.integer "transfer_type"
    t.integer "min_transfer_time"
    t.string "from_route_identifier"
    t.string "to_route_identifier"
    t.string "from_trip_identifier"
    t.string "to_trip_identifier"
  end

  create_table "trips", force: :cascade do |t|
    t.string "route_identifier"
    t.string "service_identifier"
    t.string "trip_identifier"
    t.string "trip_headsign"
    t.string "trip_short_name"
    t.string "direction_identifier"
    t.string "block_identifier"
    t.string "shape_identifier"
    t.integer "length_cache"
  end

end
