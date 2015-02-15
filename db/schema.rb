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

ActiveRecord::Schema.define(version: 20150215002553) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "drill_groups", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "level_id"
  end

  add_index "drill_groups", ["level_id"], name: "index_drill_groups_on_level_id", using: :btree

  create_table "drills", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "drill_group_id"
    t.integer  "level_id"
  end

  add_index "drills", ["drill_group_id"], name: "index_drills_on_drill_group_id", using: :btree
  add_index "drills", ["level_id"], name: "index_drills_on_level_id", using: :btree

  create_table "levels", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "scorecards", force: :cascade do |t|
    t.integer  "total_drills"
    t.integer  "correct_drills"
    t.integer  "user_id"
    t.integer  "drill_group_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "scorecards", ["drill_group_id"], name: "index_scorecards_on_drill_group_id", using: :btree
  add_index "scorecards", ["user_id"], name: "index_scorecards_on_user_id", using: :btree

  create_table "solutions", force: :cascade do |t|
    t.integer  "drill_id"
    t.integer  "admin_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.text     "content"
    t.boolean  "exact_match", default: true
  end

  add_index "solutions", ["admin_id"], name: "index_solutions_on_admin_id", using: :btree
  add_index "solutions", ["drill_id"], name: "index_solutions_on_drill_id", using: :btree

  create_table "subscriptions", force: :cascade do |t|
    t.integer  "drill_group_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "user_id"
  end

  add_index "subscriptions", ["drill_group_id"], name: "index_subscriptions_on_drill_group_id", using: :btree
  add_index "subscriptions", ["user_id"], name: "index_subscriptions_on_user_id", using: :btree

  create_table "tagifications", force: :cascade do |t|
    t.integer  "tag_id"
    t.integer  "drill_group_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "tagifications", ["drill_group_id"], name: "index_tagifications_on_drill_group_id", using: :btree
  add_index "tagifications", ["tag_id"], name: "index_tagifications_on_tag_id", using: :btree

  create_table "tags", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "drill_id"
    t.integer  "solution_id"
    t.integer  "drill_group_id"
  end

  add_index "users", ["drill_group_id"], name: "index_users_on_drill_group_id", using: :btree
  add_index "users", ["drill_id"], name: "index_users_on_drill_id", using: :btree
  add_index "users", ["solution_id"], name: "index_users_on_solution_id", using: :btree

  add_foreign_key "drill_groups", "levels"
  add_foreign_key "drills", "drill_groups"
  add_foreign_key "drills", "levels"
  add_foreign_key "scorecards", "drill_groups"
  add_foreign_key "scorecards", "users"
  add_foreign_key "solutions", "drills"
  add_foreign_key "subscriptions", "drill_groups"
  add_foreign_key "subscriptions", "users"
  add_foreign_key "tagifications", "drill_groups"
  add_foreign_key "tagifications", "tags"
  add_foreign_key "users", "drill_groups"
  add_foreign_key "users", "drills"
  add_foreign_key "users", "solutions"
end
