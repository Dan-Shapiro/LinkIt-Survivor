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

ActiveRecord::Schema.define(version: 2020_04_03_195653) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "confessionals", force: :cascade do |t|
    t.bigint "user_id"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_confessionals_on_user_id"
  end

  create_table "games", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "active"
  end

  create_table "polls", force: :cascade do |t|
    t.bigint "vote_id"
    t.bigint "user_id"
    t.string "vote_for"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_polls_on_user_id"
    t.index ["vote_id"], name: "index_polls_on_vote_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.string "subtitle"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.index ["slug"], name: "index_posts_on_slug", unique: true
  end

  create_table "scores", force: :cascade do |t|
    t.bigint "game_id"
    t.bigint "user_id"
    t.decimal "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_scores_on_game_id"
    t.index ["user_id"], name: "index_scores_on_user_id"
  end

  create_table "tribe_votes", force: :cascade do |t|
    t.bigint "tribe_id"
    t.bigint "vote_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tribe_id"], name: "index_tribe_votes_on_tribe_id"
    t.index ["vote_id"], name: "index_tribe_votes_on_vote_id"
  end

  create_table "tribes", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "ordering"
    t.string "display_name"
    t.string "flag_filename"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
    t.bigint "tribe_id"
    t.string "nickname"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["tribe_id"], name: "index_users_on_tribe_id"
  end

  create_table "votes", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "poll"
    t.bigint "tribe_id"
    t.index ["tribe_id"], name: "index_votes_on_tribe_id"
  end

  add_foreign_key "confessionals", "users"
  add_foreign_key "polls", "users"
  add_foreign_key "polls", "votes"
  add_foreign_key "scores", "games"
  add_foreign_key "scores", "users"
  add_foreign_key "tribe_votes", "tribes"
  add_foreign_key "tribe_votes", "votes"
  add_foreign_key "users", "tribes"
  add_foreign_key "votes", "tribes"
end
