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

ActiveRecord::Schema[7.1].define(version: 2024_01_24_215553) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_accounts_on_user_id"
  end

  create_table "api_keys", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "key", null: false
    t.bigint "environment_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["environment_id", "name"], name: "index_api_keys_on_environment_id_and_name", unique: true
    t.index ["environment_id"], name: "index_api_keys_on_environment_id"
    t.index ["key"], name: "index_api_keys_on_key", unique: true
  end

  create_table "environments", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.bigint "project_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_environments_on_project_id"
  end

  create_table "feature_flags", force: :cascade do |t|
    t.string "key", null: false
    t.string "description"
    t.bigint "project_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "archived_at"
    t.index ["project_id", "key"], name: "index_feature_flags_on_project_id_and_key", unique: true
    t.index ["project_id"], name: "index_feature_flags_on_project_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.bigint "account_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_projects_on_account_id"
  end

  create_table "treatments", force: :cascade do |t|
    t.bigint "environment_id", null: false
    t.bigint "feature_flag_id", null: false
    t.boolean "enabled", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["environment_id"], name: "index_treatments_on_environment_id"
    t.index ["feature_flag_id", "environment_id"], name: "index_treatments_on_feature_flag_id_and_environment_id", unique: true
    t.index ["feature_flag_id"], name: "index_treatments_on_feature_flag_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "accounts", "users"
  add_foreign_key "api_keys", "environments"
  add_foreign_key "environments", "projects"
  add_foreign_key "feature_flags", "projects"
  add_foreign_key "projects", "accounts"
  add_foreign_key "treatments", "environments"
  add_foreign_key "treatments", "feature_flags"
end
