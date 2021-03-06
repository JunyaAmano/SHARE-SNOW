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

ActiveRecord::Schema.define(version: 2020_12_22_170439) do

  create_table "chats", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "group_id", null: false
    t.text "content", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "entries", force: :cascade do |t|
    t.integer "user_id"
    t.integer "room_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "event_comments", force: :cascade do |t|
    t.text "comment"
    t.integer "user_id"
    t.integer "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "event_users", force: :cascade do |t|
    t.integer "event_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.text "title"
    t.datetime "departure_date"
    t.datetime "return_date"
    t.datetime "deadline_date"
    t.integer "applicant_number"
    t.integer "transportation_expense"
    t.text "description"
    t.boolean "is_published"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_id"
    t.integer "user_id"
    t.integer "ski_slope_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "name", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "inquiries", force: :cascade do |t|
    t.string "name"
    t.string "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email"
  end

  create_table "messages", force: :cascade do |t|
    t.integer "user_id"
    t.integer "room_id"
    t.text "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notifications", force: :cascade do |t|
    t.integer "visitor_id", null: false
    t.integer "visited_id", null: false
    t.integer "room_id"
    t.integer "message_id"
    t.integer "user_post_id"
    t.integer "user_post_comment_id"
    t.integer "event_id"
    t.integer "event_comment_id"
    t.string "action", default: "", null: false
    t.boolean "checked", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_comment_id"], name: "index_notifications_on_event_comment_id"
    t.index ["event_id"], name: "index_notifications_on_event_id"
    t.index ["message_id"], name: "index_notifications_on_message_id"
    t.index ["room_id"], name: "index_notifications_on_room_id"
    t.index ["user_post_comment_id"], name: "index_notifications_on_user_post_comment_id"
    t.index ["user_post_id"], name: "index_notifications_on_user_post_id"
    t.index ["visited_id"], name: "index_notifications_on_visited_id"
    t.index ["visitor_id"], name: "index_notifications_on_visitor_id"
  end

  create_table "relationships", force: :cascade do |t|
    t.integer "follower_id"
    t.integer "followed_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["followed_id", "follower_id"], name: "index_relationships_on_followed_id_and_follower_id", unique: true
    t.index ["followed_id"], name: "index_relationships_on_followed_id"
    t.index ["follower_id"], name: "index_relationships_on_follower_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ski_slopes", force: :cascade do |t|
    t.string "title"
    t.string "area"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_post_comments", force: :cascade do |t|
    t.text "comment"
    t.integer "user_id"
    t.integer "user_post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_post_favorites", force: :cascade do |t|
    t.integer "user_id"
    t.integer "user_post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_posts", force: :cascade do |t|
    t.text "content"
    t.string "image_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "score", precision: 5, scale: 3
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.integer "age"
    t.boolean "is_published"
    t.boolean "is_owned"
    t.integer "gender"
    t.integer "riding_style"
    t.text "introduction"
    t.date "birthday"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_id"
    t.integer "ski_slope_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
