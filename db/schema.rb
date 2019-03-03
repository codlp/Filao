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

ActiveRecord::Schema.define(version: 2019_03_03_173022) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "documents", force: :cascade do |t|
    t.bigint "task_id"
    t.string "name"
    t.date "upload_date"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["task_id"], name: "index_documents_on_task_id"
    t.index ["user_id"], name: "index_documents_on_user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.bigint "task_id"
    t.text "content"
    t.date "upload_date"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["task_id"], name: "index_messages_on_task_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "status"
    t.date "start_date"
    t.date "end_date"
    t.integer "user_id"
    t.integer "customer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "category"
    t.index ["customer_id"], name: "index_projects_on_customer_id"
    t.index ["user_id"], name: "index_projects_on_user_id"
  end

  create_table "steps", force: :cascade do |t|
    t.bigint "project_id"
    t.string "name"
    t.boolean "is_completed"
    t.float "completion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_steps_on_project_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.bigint "project_id"
    t.string "name"
    t.text "description"
    t.string "status"
    t.date "start_date"
    t.date "end_date"
    t.integer "duration"
    t.boolean "deliverable", default: false
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_done", default: false
    t.bigint "step_id"
    t.index ["project_id"], name: "index_tasks_on_project_id"
    t.index ["step_id"], name: "index_tasks_on_step_id"
    t.index ["user_id"], name: "index_tasks_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo"
    t.string "first_name"
    t.string "last_name"
    t.string "google_token"
    t.string "google_refresh_token"
    t.boolean "is_customer", default: false
    t.string "company"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "documents", "tasks"
  add_foreign_key "documents", "users"
  add_foreign_key "messages", "tasks"
  add_foreign_key "messages", "users"
  add_foreign_key "steps", "projects"
  add_foreign_key "tasks", "projects"
  add_foreign_key "tasks", "steps"
  add_foreign_key "tasks", "users"
end
