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

ActiveRecord::Schema[7.0].define(version: 2024_02_15_124004) do
  create_table "drivers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "contact_no"
    t.string "email"
    t.boolean "covid_vaccinated"
    t.string "profile_image"
    t.integer "passenger_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "vehicle_id"
    t.index ["passenger_id"], name: "index_drivers_on_passenger_id"
    t.index ["vehicle_id"], name: "index_drivers_on_vehicle_id"
  end

  create_table "passengers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "current_location"
    t.string "contact_no"
    t.string "email"
    t.string "password"
    t.string "verification_code"
    t.boolean "verify"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "otp_secret"
    t.integer "consumed_timestep"
    t.boolean "otp_required_for_login"
    t.index ["email"], name: "index_passengers_on_email", unique: true
  end

  create_table "rides", force: :cascade do |t|
    t.string "location_from"
    t.string "location_to"
    t.datetime "date_time_when"
    t.integer "offer_fare"
    t.integer "passenger_id", null: false
    t.integer "driver_id", null: false
    t.string "confirmation_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["driver_id"], name: "index_rides_on_driver_id"
    t.index ["passenger_id"], name: "index_rides_on_passenger_id"
  end

  create_table "vehicles", force: :cascade do |t|
    t.integer "type"
    t.string "vehicle_plate_no"
    t.string "name"
    t.integer "driver_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["driver_id"], name: "index_vehicles_on_driver_id"
  end

  add_foreign_key "drivers", "passengers"
  add_foreign_key "drivers", "vehicles"
  add_foreign_key "rides", "drivers"
  add_foreign_key "rides", "passengers"
  add_foreign_key "vehicles", "drivers"
end
