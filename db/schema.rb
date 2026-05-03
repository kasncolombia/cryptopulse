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

ActiveRecord::Schema[8.1].define(version: 2026_05_02_201137) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "alerts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.bigint "crypto_asset_id", null: false
    t.integer "direction"
    t.integer "status"
    t.decimal "target_price"
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["crypto_asset_id"], name: "index_alerts_on_crypto_asset_id"
    t.index ["user_id"], name: "index_alerts_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name"
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_categories_on_name"
  end

  create_table "crypto_assets", force: :cascade do |t|
    t.string "coingecko_id"
    t.datetime "created_at", null: false
    t.string "image_url"
    t.string "name"
    t.string "symbol"
    t.datetime "updated_at", null: false
    t.index ["coingecko_id"], name: "index_crypto_assets_on_coingecko_id"
    t.index ["symbol"], name: "index_crypto_assets_on_symbol"
  end

  create_table "prices", force: :cascade do |t|
    t.decimal "change_24h"
    t.datetime "created_at", null: false
    t.bigint "crypto_asset_id", null: false
    t.decimal "market_cap"
    t.decimal "price"
    t.datetime "updated_at", null: false
    t.index ["crypto_asset_id"], name: "index_prices_on_crypto_asset_id"
  end

  create_table "subcategories", force: :cascade do |t|
    t.bigint "category_id", null: false
    t.datetime "created_at", null: false
    t.string "name"
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_subcategories_on_category_id"
    t.index ["name"], name: "index_subcategories_on_name"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.datetime "remember_created_at"
    t.datetime "reset_password_sent_at"
    t.string "reset_password_token"
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "watchlists", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.bigint "crypto_asset_id", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["crypto_asset_id"], name: "index_watchlists_on_crypto_asset_id"
    t.index ["user_id"], name: "index_watchlists_on_user_id"
  end

  add_foreign_key "alerts", "crypto_assets"
  add_foreign_key "alerts", "users"
  add_foreign_key "prices", "crypto_assets"
  add_foreign_key "subcategories", "categories"
  add_foreign_key "watchlists", "crypto_assets"
  add_foreign_key "watchlists", "users"
end
