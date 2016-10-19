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

ActiveRecord::Schema.define(version: 20161019102732) do

  create_table "cars", force: :cascade do |t|
    t.string   "name"
    t.string   "legal_num"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "call_num"
    t.integer  "mileage"
    t.string   "car_base"
    t.string   "car_photo"
  end

  create_table "officers", force: :cascade do |t|
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
    t.string   "name"
    t.string   "username"
    t.index ["email"], name: "index_officers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_officers_on_reset_password_token", unique: true
  end

  create_table "reports", force: :cascade do |t|
    t.integer  "author_id"
    t.integer  "car_id"
    t.integer  "mileage_before"
    t.integer  "mileage_after"
    t.integer  "mileage_day"
    t.integer  "mileage_day_gps"
    t.integer  "fuel_spend"
    t.float    "fuel_income"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "gps_difference"
    t.integer  "mileage_board"
    t.float    "max_speed"
    t.boolean  "mileage_match"
    t.float    "fuel_difference"
    t.integer  "overspeed"
    t.date     "report_date"
    t.integer  "officer_id"
    t.integer  "videorecorder_exist_quantity"
    t.integer  "videorecorder_quantity"
    t.boolean  "tablet_exist"
    t.integer  "armor_exist_quantity"
    t.integer  "armor_quantity"
    t.integer  "helmet_exist_quantity"
    t.integer  "helmet_quantity"
    t.integer  "radio_exist_quantity"
    t.integer  "radio_quantity"
    t.integer  "pistol_exist"
    t.integer  "pistol_quantity"
    t.integer  "machine_gun_exist"
    t.integer  "machine_gun_quantity"
    t.integer  "baton_exist"
    t.integer  "baton_quantity"
    t.boolean  "car_kit"
  end

  create_table "sign_ins", force: :cascade do |t|
    t.datetime "sign_in_at"
    t.string   "sign_in_ip"
    t.string   "sign_in_officer"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "signins", force: :cascade do |t|
    t.datetime "sign_in_at"
    t.string   "sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
