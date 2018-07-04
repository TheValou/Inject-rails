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

ActiveRecord::Schema.define(version: 20180703131348) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

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
    t.integer "os_id", default: 1
    t.integer "cpu_id", default: 1
    t.integer "gpu_id", default: 1
    t.integer "activity_id", default: 1
    t.integer "chipset_id", default: 1
    t.string "picture", limit: 512
    t.string "designation", limit: 256
    t.string "model", limit: 256, null: false
    t.string "connector_available", limit: 2048
    t.string "weight", limit: 16
    t.string "length", limit: 16
    t.string "width", limit: 16
    t.string "height", limit: 16
    t.string "memory_type", limit: 128
    t.string "memory_size", limit: 128
    t.string "memory_max_size", limit: 128
    t.string "keyboard_type", limit: 128
    t.boolean "keyboard_numpad"
    t.boolean "keyboard_light"
    t.string "screen_type", limit: 256
    t.string "screen_resolution", limit: 256
    t.integer "screen_refresh_rate"
    t.float "screen_size"
    t.string "screen_format", limit: 16
    t.string "network", limit: 128
    t.boolean "webcam"
    t.boolean "active", default: true, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "brand_id"
  end

  create_table "computers_activities", id: :serial, force: :cascade do |t|
    t.string "name", limit: 64, null: false
    t.string "description", limit: 512
  end

  create_table "computers_brands", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "description"
  end

  create_table "computers_chipsets", id: :serial, force: :cascade do |t|
    t.string "name", limit: 64, null: false
    t.string "description", limit: 512
  end

  create_table "computers_cpus", id: :serial, force: :cascade do |t|
    t.string "name", limit: 128, null: false
    t.integer "score"
    t.string "description", limit: 512
  end

  create_table "computers_disks", id: :serial, force: :cascade do |t|
    t.integer "computer_id", null: false
    t.integer "size"
    t.string "interface", limit: 1024
    t.integer "type"
  end

  create_table "computers_gpus", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255, null: false
    t.float "score", default: 0.0
    t.string "description", limit: 1024
    t.string "memory_type"
    t.integer "max_memory"
  end

  create_table "computers_os", id: :serial, force: :cascade do |t|
    t.string "name", limit: 128, null: false
    t.string "description", limit: 128
  end

  create_table "computers_prices", id: :serial, force: :cascade do |t|
    t.integer "computer_id", null: false
    t.integer "trader_id", null: false
    t.string "url", limit: 512
    t.datetime "created_at"
    t.datetime "updated_at"
    t.hstore "pricing"
    t.integer "last_price"
    t.index ["url"], name: "index_computers_prices_on_url", unique: true
  end

  create_table "computers_quests", id: :serial, force: :cascade do |t|
    t.integer "activity_id", null: false
    t.integer "rank", null: false
    t.string "quest", limit: 512, null: false
    t.string "domain", limit: 16
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "computers_quests_resps", id: :serial, force: :cascade do |t|
    t.integer "quest_id", null: false
    t.string "resp", limit: 32, null: false
    t.string "indice", limit: 32, null: false
  end

  create_table "computers_traders", id: :serial, force: :cascade do |t|
    t.string "name", limit: 128, null: false
    t.string "description", limit: 512
  end

  create_table "users_auth", id: :serial, force: :cascade do |t|
    t.string "name", limit: 32, null: false
    t.string "description", limit: 128
  end

  add_foreign_key "computers", "computers_activities", column: "activity_id", name: "computers_activity_id_fkey"
  add_foreign_key "computers", "computers_chipsets", column: "chipset_id", name: "computers_chipset_id_fkey"
  add_foreign_key "computers", "computers_cpus", column: "cpu_id", name: "computers_cpu_id_fkey"
  add_foreign_key "computers", "computers_gpus", column: "gpu_id", name: "computers_gpu_id_fkey"
  add_foreign_key "computers", "computers_os", column: "os_id", name: "computers_os_id_fkey"
  add_foreign_key "computers_disks", "computers", name: "computers_disks_computer_id_fkey"
  add_foreign_key "computers_prices", "computers", name: "computers_prices_computer_id_fkey"
  add_foreign_key "computers_prices", "computers_traders", column: "trader_id", name: "computers_prices_trader_id_fkey"
  add_foreign_key "computers_quests", "computers_activities", column: "activity_id", name: "computers_quests_activity_id_fkey"
  add_foreign_key "computers_quests_resps", "computers_quests", column: "quest_id", name: "computers_quests_resps_quest_id_fkey"
end
