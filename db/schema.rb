# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150526011537) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "books", force: :cascade do |t|
    t.string   "name"
    t.integer  "order_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "chapters", force: :cascade do |t|
    t.integer  "number_id"
    t.integer  "book_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "chapters", ["book_id"], name: "index_chapters_on_book_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "verses", force: :cascade do |t|
    t.integer  "vote_count"
    t.integer  "chapter_id"
    t.integer  "book_id"
    t.text     "content"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "order_id"
  end

  add_index "verses", ["book_id"], name: "index_verses_on_book_id", using: :btree
  add_index "verses", ["chapter_id"], name: "index_verses_on_chapter_id", using: :btree
  add_index "verses", ["user_id"], name: "index_verses_on_user_id", using: :btree

  add_foreign_key "chapters", "books"
  add_foreign_key "verses", "books"
  add_foreign_key "verses", "chapters"
  add_foreign_key "verses", "users"
end
