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

ActiveRecord::Schema.define(version: 20171101193504) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "pledges", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.float "dollar_amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "project_id"
    t.integer "reward_id"
    t.index ["project_id"], name: "index_pledges_on_project_id"
    t.index ["user_id"], name: "index_pledges_on_user_id"
  end

  create_table "project_comments", force: :cascade do |t|
    t.text "comment"
    t.integer "user_id"
    t.bigint "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "project_updates", force: :cascade do |t|
    t.bigint "project_id"
    t.string "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_project_updates_on_project_id"
  end

  create_table "projects", id: :serial, force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.integer "goal"
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "image"
    t.integer "user_id"
  end

  create_table "projects_tags", force: :cascade do |t|
    t.integer "tag_id"
    t.integer "project_id"
  end

  create_table "rewards", id: :serial, force: :cascade do |t|
    t.integer "project_id"
    t.string "description"
    t.float "dollar_amount"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "limit"
    t.integer "claimed", default: 0
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "admin", default: false
    t.string "password_digest"
    t.string "cover_pic", default: "crowdfunder_hero.jpg"
    t.string "user_pic", default: "profile-pic-default.png"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "pledges", "projects"
  add_foreign_key "pledges", "users"
end
