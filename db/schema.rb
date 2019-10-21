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

ActiveRecord::Schema.define(version: 2019_10_21_164348) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "favorite_accounts", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "twitter_account_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["twitter_account_id"], name: "index_favorite_accounts_on_twitter_account_id"
    t.index ["user_id"], name: "index_favorite_accounts_on_user_id"
  end

  create_table "tweet_accounts", force: :cascade do |t|
    t.bigint "twitter_account_id"
    t.bigint "tweet_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tweet_id"], name: "index_tweet_accounts_on_tweet_id"
    t.index ["twitter_account_id"], name: "index_tweet_accounts_on_twitter_account_id"
  end

  create_table "tweets", force: :cascade do |t|
    t.text "content"
    t.float "sentiment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "twitter_accounts", force: :cascade do |t|
    t.string "name"
    t.string "twitter_account"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "favorite_accounts", "twitter_accounts"
  add_foreign_key "favorite_accounts", "users"
  add_foreign_key "tweet_accounts", "tweets"
  add_foreign_key "tweet_accounts", "twitter_accounts"
end
