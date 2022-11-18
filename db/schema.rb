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

ActiveRecord::Schema[7.0].define(version: 2022_11_04_184011) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "halal_items", force: :cascade do |t|
    t.string "name"
    t.integer "restaurant_id"
    t.string "description"
    t.string "verification"
    t.boolean "vegan"
    t.boolean "gluten_free"
    t.boolean "vegetarian"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "locations", force: :cascade do |t|
    t.string "state"
    t.integer "zipcode"
    t.string "address"
    t.float "latitude"
    t.float "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts", force: :cascade do |t|
    t.string "name"
    t.string "title"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "restaurants", force: :cascade do |t|
    t.string "name"
    t.string "cuisine"
    t.string "state"
    t.integer "zipcode"
    t.string "address"
    t.string "city"
    t.float "latitude"
    t.float "longitude"
    t.string "url"
    t.string "rating"
    t.bigint "reviews_id"
    t.bigint "halal_items_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["halal_items_id"], name: "index_restaurants_on_halal_items_id"
    t.index ["reviews_id"], name: "index_restaurants_on_reviews_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "restaurant_id"
    t.integer "halal_item_id"
    t.integer "user_id"
    t.date "date_of_review"
    t.string "content"
    t.integer "rating"
    t.bigint "users_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id", "restaurant_id", "created_at"], name: "index_reviews_on_user_id_and_restaurant_id_and_created_at"
    t.index ["users_id"], name: "index_reviews_on_users_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "remember_digest"
    t.boolean "admin"
    t.string "activation_digest"
    t.boolean "activated", default: false
    t.datetime "activated_at"
  end

  add_foreign_key "restaurants", "halal_items", column: "halal_items_id"
  add_foreign_key "restaurants", "reviews", column: "reviews_id"
  add_foreign_key "reviews", "users", column: "users_id"
end
