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

ActiveRecord::Schema.define(version: 20140705210450) do

  create_table "addresses", force: true do |t|
    t.string   "zip_code"
    t.string   "type_address"
    t.string   "address"
    t.string   "number"
    t.string   "complement"
    t.string   "neighborhood"
    t.string   "city"
    t.string   "state"
    t.text     "note"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cnhs", force: true do |t|
    t.string   "category"
    t.string   "registration"
    t.boolean  "first"
    t.date     "validity"
    t.integer  "customer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "first_registration"
    t.integer  "photo_id"
  end

  add_index "cnhs", ["customer_id"], name: "index_cnhs_on_customer_id"
  add_index "cnhs", ["photo_id"], name: "index_cnhs_on_photo_id"

  create_table "customer_addresses", force: true do |t|
    t.integer  "customer_id"
    t.integer  "address_id"
    t.boolean  "commercial"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "customer_addresses", ["address_id"], name: "index_customer_addresses_on_address_id"
  add_index "customer_addresses", ["customer_id"], name: "index_customer_addresses_on_customer_id"

  create_table "customer_phones", force: true do |t|
    t.integer  "customer_id"
    t.integer  "phone_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "customer_phones", ["customer_id"], name: "index_customer_phones_on_customer_id"

  create_table "customers", force: true do |t|
    t.string   "name"
    t.string   "fname"
    t.string   "mname"
    t.string   "country"
    t.string   "city"
    t.string   "uf"
    t.date     "birth"
    t.string   "email"
    t.text     "annotation"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "schooling"
    t.string   "civil_status"
    t.string   "cpf"
    t.string   "rg"
  end

  create_table "instructors", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "active",     default: true
  end

  create_table "phones", force: true do |t|
    t.string   "code"
    t.string   "number"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "photos", force: true do |t|
    t.string   "path"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "schedules", force: true do |t|
    t.string   "event"
    t.date     "date"
    t.time     "time"
    t.integer  "vehicle_id"
    t.integer  "instructor_id"
    t.integer  "customer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "complete"
    t.string   "description"
  end

  add_index "schedules", ["customer_id"], name: "index_schedules_on_customer_id"
  add_index "schedules", ["instructor_id"], name: "index_schedules_on_instructor_id"
  add_index "schedules", ["vehicle_id"], name: "index_schedules_on_vehicle_id"

  create_table "vehicles", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "instructor_id"
    t.string   "vehicle_plate"
    t.integer  "show_order"
    t.boolean  "active"
  end

  add_index "vehicles", ["instructor_id"], name: "index_vehicles_on_instructor_id"

end
