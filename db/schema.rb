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

ActiveRecord::Schema.define(version: 20180220193145) do

  # These are extensions that must be enabled in order to support this database 
  enable_extension "plpgsql"

  create_table "coupons", force: :cascade do |t|
    t.integer "user_id"
    t.string "code"
    t.integer "discount"
    t.boolean "valid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mailing_list", force: :cascade do |t|
    t.integer "user_id"
    t.string "code"
    t.integer "discount"
    t.boolean "valid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer "product_id"
    t.integer "user_id"
    t.integer "qty"
    t.decimal "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_orders_on_product_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "orders_products", id: false, force: :cascade do |t|
    t.bigint "order_id"
    t.bigint "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_orders_products_on_order_id"
    t.index ["product_id"], name: "index_orders_products_on_product_id"
  end

  create_table "product_infos", force: :cascade do |t|
    t.integer "product_id"
    t.string "product_dimensions"
    t.string "item_model_number"
    t.float "volume"
    t.string "volume_units"
    t.string "storage_instructions"
    t.string "country_of_origin"
    t.string "primary_ingredient_origin"
    t.string "format"
    t.string "speciality"
    t.string "certification"
    t.string "caffeine"
    t.string "awards"
    t.string "manufacturer"
    t.text "important_info"
    t.text "manufacturer_info"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.decimal "rrp"
    t.decimal "price"
    t.text "details"
    t.text "description"
    t.string "category"
    t.string "brand"
    t.integer "stock"
    t.boolean "live", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo_file_name"
    t.string "photo_content_type"
    t.integer "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "user_infos", force: :cascade do |t|
    t.integer "user_id"
    t.string "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "country"
    t.string "postcode"
    t.string "street_ad"
    t.string "street_ad2"
    t.string "town_city"
    t.string "phone_no"
    t.string "county"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "stripe_id"
    t.string "stripe_subscription_id"
    t.string "card_brand"
    t.string "card_last4"
    t.string "card_exp_month"
    t.string "card_exp_year"
    t.datetime "expires_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "avatar_file_name"
    t.string "avatar_content_type"
    t.integer "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
