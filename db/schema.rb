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

ActiveRecord::Schema.define(version: 20180516081751) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "SequelizeMeta", primary_key: "name", id: :string, limit: 255, force: :cascade do |t|
  end

  create_table "computer_disks", force: :cascade do |t|
    t.integer "disk_type", default: 1
    t.integer "size"
    t.string "interface"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "computers", id: :serial, force: :cascade do |t|
    t.integer "osid", default: 1
    t.integer "cpuid", default: 1
    t.integer "gpuid", default: 1
    t.integer "activityid", default: 1
    t.integer "chipsetid", default: 1
    t.string "picture", limit: 512
    t.string "designation", limit: 256
    t.string "model", limit: 256, null: false
    t.string "connector_available", limit: 2048
    t.string "weight", limit: 16
    t.string "length", limit: 16
    t.string "width", limit: 16
    t.string "height", limit: 16
    t.string "memory_size", limit: 128
    t.string "memory_type", limit: 128
    t.string "memory_max_size", limit: 128
    t.string "storage_size", limit: 128
    t.string "storage_type", limit: 128
    t.string "network", limit: 128
    t.boolean "webcam", default: true, null: false
    t.boolean "active", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "keyboard_type"
    t.boolean "keyboard_numpad"
    t.boolean "keyboard_light"
    t.string "screen_type"
    t.string "screen_resolution"
    t.integer "screen_refresh_rate"
    t.float "screen_size"
    t.string "screen_format"
  end

  create_table "computers_activities", id: :serial, force: :cascade do |t|
    t.string "name", limit: 64, null: false
    t.string "description", limit: 512
  end

  create_table "computers_chipsets", id: :serial, force: :cascade do |t|
    t.string "name", limit: 64, null: false
    t.string "description", limit: 512
  end

  create_table "computers_cpus", id: :serial, force: :cascade do |t|
    t.string "name", limit: 128, null: false
    t.string "description", limit: 512
  end

  create_table "computers_gpus", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255, null: false
    t.string "description", limit: 1024
  end

  create_table "computers_os", id: :serial, force: :cascade do |t|
    t.string "name", limit: 128, null: false
    t.string "description", limit: 128
  end

  create_table "computers_prices", id: :serial, force: :cascade do |t|
    t.integer "computerId", null: false
    t.integer "traderId", null: false
    t.integer "pricing", null: false
    t.string "url", limit: 512, null: false
    t.datetime "createdat", null: false
  end

  create_table "computers_quests", id: :serial, force: :cascade do |t|
    t.integer "activityId", null: false
    t.string "quest", limit: 512, null: false
    t.string "domain", limit: 64, null: false
    t.datetime "createdat", null: false
    t.datetime "updatedat", null: false
  end

  create_table "computers_quests_resps", id: :serial, force: :cascade do |t|
    t.integer "questId", null: false
    t.string "resp", limit: 32, null: false
    t.string "indice", limit: 32, null: false
  end

  create_table "computers_traders", id: :serial, force: :cascade do |t|
    t.string "name", limit: 128, null: false
    t.string "description", limit: 512
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.integer "roleId"
    t.integer "authId"
    t.string "firstname", limit: 128, null: false
    t.string "lastname", limit: 256, null: false
    t.string "email", limit: 255, null: false
    t.string "password", limit: 1024, null: false
    t.boolean "active", default: true, null: false
    t.datetime "createdat", null: false
    t.datetime "updatedat", null: false
  end

  create_table "users_auth", id: :serial, force: :cascade do |t|
    t.string "name", limit: 32, null: false
    t.string "description", limit: 128
  end

  create_table "users_roles", id: :serial, force: :cascade do |t|
    t.string "name", limit: 30, null: false
    t.string "description", limit: 50
  end

  add_foreign_key "computers", "computers_activities", column: "activityid", name: "computers_activityid_fkey"
  add_foreign_key "computers", "computers_chipsets", column: "chipsetid", name: "computers_chipsetid_fkey"
  add_foreign_key "computers", "computers_cpus", column: "cpuid", name: "computers_cpuid_fkey"
  add_foreign_key "computers", "computers_gpus", column: "gpuid", name: "computers_gpuid_fkey"
  add_foreign_key "computers", "computers_os", column: "osid", name: "computers_osid_fkey"
  add_foreign_key "computers_prices", "computers", column: "computerId", name: "computers_prices_computerId_fkey"
  add_foreign_key "computers_prices", "computers_traders", column: "traderId", name: "computers_prices_traderId_fkey"
  add_foreign_key "computers_quests", "computers_activities", column: "activityId", name: "computers_quests_activityId_fkey"
  add_foreign_key "computers_quests_resps", "computers_quests", column: "questId", name: "computers_quests_resps_questId_fkey"
  add_foreign_key "users", "users_auth", column: "authId", name: "users_authId_fkey"
  add_foreign_key "users", "users_roles", column: "roleId", name: "users_roleId_fkey"
end
