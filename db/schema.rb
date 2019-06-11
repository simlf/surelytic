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

ActiveRecord::Schema.define(version: 2019_06_11_085207) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "organizations", force: :cascade do |t|
    t.string "name"
    t.string "ga_account_service_id"
    t.integer "current_credits"
    t.integer "monthly_credits"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projects", force: :cascade do |t|
    t.bigint "organization_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id"], name: "index_projects_on_organization_id"
  end

  create_table "results", force: :cascade do |t|
    t.bigint "test_id"
    t.boolean "correct"
    t.integer "number_total_values"
    t.integer "number_incorrect_values"
    t.jsonb "top_incorrect_values"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["test_id"], name: "index_results_on_test_id"
  end

  create_table "tests", force: :cascade do |t|
    t.string "name"
    t.string "frequency"
    t.string "ga_report_type"
    t.string "ga_link"
    t.integer "cd_index"
    t.string "cd_regex"
    t.integer "cd_scope"
    t.string "eec_product_name_regex"
    t.string "eec_product_id_regex"
    t.string "eec_product_category_regex"
    t.string "eec_product_brand_regex"
    t.string "event_category_regex"
    t.string "event_action_regex"
    t.string "event_label_regex"
    t.integer "goal_index"
    t.bigint "user_id"
    t.bigint "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_tests_on_project_id"
    t.index ["user_id"], name: "index_tests_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "role"
    t.bigint "organization_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["organization_id"], name: "index_users_on_organization_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "projects", "organizations"
  add_foreign_key "results", "tests"
  add_foreign_key "tests", "projects"
  add_foreign_key "tests", "users"
  add_foreign_key "users", "organizations"
end
