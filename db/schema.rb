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

ActiveRecord::Schema[7.0].define(version: 2024_12_04_084952) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "affiliations", force: :cascade do |t|
    t.bigint "organization_id"
    t.string "title"
    t.datetime "deleted_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id"], name: "index_affiliations_on_organization_id"
  end

  create_table "categories", force: :cascade do |t|
    t.bigint "affiliation_id"
    t.string "title"
    t.datetime "deleted_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["affiliation_id"], name: "index_categories_on_affiliation_id"
  end

  create_table "inventories", force: :cascade do |t|
    t.uuid "user_id"
    t.bigint "period_id"
    t.bigint "site_id"
    t.bigint "tool_id"
    t.integer "opening_stock"
    t.integer "current_stock"
    t.datetime "deleted_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["period_id"], name: "index_inventories_on_period_id"
    t.index ["site_id"], name: "index_inventories_on_site_id"
    t.index ["tool_id"], name: "index_inventories_on_tool_id"
    t.index ["user_id"], name: "index_inventories_on_user_id"
  end

  create_table "organizations", force: :cascade do |t|
    t.string "title"
    t.datetime "deleted_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "periods", force: :cascade do |t|
    t.bigint "organization_id"
    t.date "started_at"
    t.date "closed_at"
    t.datetime "deleted_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id"], name: "index_periods_on_organization_id"
  end

  create_table "permissions", force: :cascade do |t|
    t.uuid "user_id"
    t.string "role"
    t.bigint "context_id"
    t.string "context_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_permissions_on_user_id"
  end

  create_table "sites", force: :cascade do |t|
    t.bigint "affiliation_id"
    t.string "title"
    t.string "description"
    t.datetime "deleted_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["affiliation_id"], name: "index_sites_on_affiliation_id"
  end

  create_table "tools", force: :cascade do |t|
    t.bigint "category_id"
    t.string "title"
    t.datetime "deleted_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_tools_on_category_id"
  end

  create_table "transfers", force: :cascade do |t|
    t.bigint "from_inventory_id"
    t.bigint "to_inventory_id"
    t.integer "delta"
    t.text "reason"
    t.text "note"
    t.datetime "deleted_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["from_inventory_id"], name: "index_transfers_on_from_inventory_id"
    t.index ["to_inventory_id"], name: "index_transfers_on_to_inventory_id"
  end

  create_table "users", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "surname", null: false
    t.string "name", null: false
    t.string "patronymic"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at", precision: nil
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["deleted_at"], name: "index_users_on_deleted_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["id"], name: "index_users_on_id", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "affiliations", "organizations"
  add_foreign_key "categories", "affiliations"
  add_foreign_key "inventories", "periods"
  add_foreign_key "inventories", "sites"
  add_foreign_key "inventories", "tools"
  add_foreign_key "inventories", "users"
  add_foreign_key "periods", "organizations"
  add_foreign_key "permissions", "users"
  add_foreign_key "sites", "affiliations"
  add_foreign_key "tools", "categories"
  add_foreign_key "transfers", "inventories", column: "from_inventory_id"
  add_foreign_key "transfers", "inventories", column: "to_inventory_id"
end
