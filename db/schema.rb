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

ActiveRecord::Schema[7.1].define(version: 2024_11_15_062812) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource"
  end

  create_table "currencies", force: :cascade do |t|
    t.string "name", null: false
    t.string "abbreviation", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["abbreviation"], name: "index_currencies_on_abbreviation", unique: true
    t.index ["name"], name: "index_currencies_on_name", unique: true
  end

  create_table "operations", force: :cascade do |t|
    t.bigint "payer_id", null: false
    t.bigint "payee_id", null: false
    t.bigint "currency_id", null: false
    t.decimal "amount", precision: 10, scale: 2, null: false
    t.integer "status", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["currency_id"], name: "index_operations_on_currency_id"
    t.index ["payee_id"], name: "index_operations_on_payee_id"
    t.index ["payer_id"], name: "index_operations_on_payer_id"
  end

  create_table "user_accounts", force: :cascade do |t|
    t.bigint "owner_id", null: false
    t.bigint "currency_id", null: false
    t.decimal "balance", precision: 10, scale: 2, null: false
    t.integer "status", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["currency_id"], name: "index_user_accounts_on_currency_id"
    t.index ["owner_id"], name: "index_user_accounts_on_owner_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "name", null: false
    t.integer "role", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "operations", "currencies"
  add_foreign_key "operations", "user_accounts", column: "payee_id"
  add_foreign_key "operations", "user_accounts", column: "payer_id"
  add_foreign_key "user_accounts", "currencies"
end
