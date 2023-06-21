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

ActiveRecord::Schema.define(version: 20230621121642) do

  create_table "hormones", force: :cascade do |t|
    t.string "name", null: false
    t.index ["name"], name: "index_hormones_on_name", unique: true
  end

  create_table "strip_batches", force: :cascade do |t|
    t.integer  "test_type",    null: false
    t.string   "manufacturer", null: false
    t.datetime "mfd",          null: false
    t.datetime "expd",         null: false
  end

  create_table "strip_hormones", force: :cascade do |t|
    t.integer "strip_id",   null: false
    t.integer "hormone_id", null: false
    t.index ["hormone_id"], name: "index_strip_hormones_on_hormone_id"
    t.index ["strip_id"], name: "index_strip_hormones_on_strip_id"
  end

  create_table "strips", force: :cascade do |t|
    t.integer "strip_batch_id"
    t.integer "status",         default: 0, null: false
    t.index ["strip_batch_id"], name: "index_strips_on_strip_batch_id"
  end

  create_table "test_hormones", force: :cascade do |t|
    t.integer "test_id",       null: false
    t.integer "hormone_id",    null: false
    t.integer "od_value",      null: false
    t.integer "concentration", null: false
    t.index ["hormone_id"], name: "index_test_hormones_on_hormone_id"
    t.index ["test_id"], name: "index_test_hormones_on_test_id"
  end

  create_table "tests", force: :cascade do |t|
    t.datetime "date",      null: false
    t.integer  "test_type", null: false
    t.integer  "user_id",   null: false
    t.integer  "strip_id",  null: false
    t.index ["strip_id"], name: "index_tests_on_strip_id", unique: true
    t.index ["user_id"], name: "index_tests_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "username",        null: false
    t.string   "password_digest", null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["username"], name: "index_users_on_username", unique: true
  end

end
