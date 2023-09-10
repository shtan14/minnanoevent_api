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

ActiveRecord::Schema[7.0].define(version: 2023_09_10_011606) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "event_images", force: :cascade do |t|
    t.bigint "event_id"
    t.string "event_image", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_event_images_on_event_id"
  end

  create_table "events", force: :cascade do |t|
    t.bigint "user_id"
    t.string "title", limit: 255, null: false
    t.text "description", null: false
    t.date "event_start_date", null: false
    t.time "event_start_time", null: false
    t.date "event_end_date", null: false
    t.time "event_end_time", null: false
    t.string "prefecture", null: false
    t.string "city", null: false
    t.string "location", limit: 255, null: false
    t.string "category", limit: 50
    t.integer "ticket_price"
    t.integer "average_rating"
    t.integer "favourites_count"
    t.integer "comments_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "favourites", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_favourites_on_event_id"
    t.index ["user_id"], name: "index_favourites_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "event_id"
    t.text "comment", null: false
    t.integer "five_star_rate", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_reviews_on_event_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "user_profiles", force: :cascade do |t|
    t.bigint "user_id"
    t.string "display_name", limit: 255, null: false
    t.text "bio", default: "", null: false
    t.string "social_media_links", limit: 255, null: false
    t.string "avatar", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_profiles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "password_digest", null: false
    t.boolean "activated", default: false, null: false
    t.boolean "admin", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "refresh_jti"
  end

  add_foreign_key "event_images", "events"
  add_foreign_key "events", "users"
  add_foreign_key "favourites", "events"
  add_foreign_key "favourites", "users"
  add_foreign_key "reviews", "events"
  add_foreign_key "reviews", "users"
  add_foreign_key "user_profiles", "users"
end
