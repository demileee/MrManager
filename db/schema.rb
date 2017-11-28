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


ActiveRecord::Schema.define(version: 20171128201822) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer "priority", default: 0, null: false
    t.integer "attempts", default: 0, null: false
    t.text "handler", null: false
    t.text "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string "locked_by"
    t.string "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["priority", "run_at"], name: "delayed_jobs_priority"
  end

  create_table "events", force: :cascade do |t|
    t.string "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "project_id"
  end

  create_table "members", force: :cascade do |t|
    t.bigint "project_id"
    t.bigint "user_id"
    t.string "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "invite_accepted", default: false
    t.index ["project_id"], name: "index_members_on_project_id"
    t.index ["user_id"], name: "index_members_on_user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.bigint "project_id"
    t.bigint "user_id"
    t.text "message_body"
    t.boolean "announcement", default: false
    t.bigint "task_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_messages_on_project_id"
    t.index ["task_id"], name: "index_messages_on_task_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.string "message"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string "title"
    t.bigint "user_id"
    t.text "description"
    t.date "soft_deadline"
    t.date "hard_deadline"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_projects_on_user_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.string "task_body"
    t.date "completed_on"
    t.integer "priority"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "project_id"
    t.bigint "user_id"
    t.bigint "message_id"
    t.boolean "assigned_by_owner"
    t.index ["message_id"], name: "index_tasks_on_message_id"
    t.index ["project_id"], name: "index_tasks_on_project_id"
    t.index ["user_id"], name: "index_tasks_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "profile_pic", default: "robohash.org/first_name?set=set4"
    t.string "email"
    t.text "notes"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "task_id"
    t.datetime "last_read"
    t.string "token"
    t.string "slack_id"
    t.index ["task_id"], name: "index_users_on_task_id"
  end

  add_foreign_key "members", "projects"
  add_foreign_key "members", "users"
  add_foreign_key "messages", "projects"
  add_foreign_key "messages", "tasks"
  add_foreign_key "messages", "users"
  add_foreign_key "projects", "users"
  add_foreign_key "users", "tasks"
end
