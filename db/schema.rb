ActiveRecord::Schema[7.0].define(version: 2023_06_06_212049) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "customers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subscription_teas", force: :cascade do |t|
    t.bigint "tea_id", null: false
    t.bigint "subscription_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["subscription_id"], name: "index_subscription_teas_on_subscription_id"
    t.index ["tea_id"], name: "index_subscription_teas_on_tea_id"
  end

  create_table "subscriptions", force: :cascade do |t|
    t.string "title"
    t.float "price"
    t.integer "status"
    t.integer "frequency"
    t.bigint "customer_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_subscriptions_on_customer_id"
  end

  create_table "teas", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.float "temperature"
    t.integer "brew_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "subscription_teas", "subscriptions"
  add_foreign_key "subscription_teas", "teas"
  add_foreign_key "subscriptions", "customers"
end
