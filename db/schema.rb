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

ActiveRecord::Schema.define(version: 20151108231738) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authorships", force: :cascade do |t|
    t.integer "book_id"
    t.integer "creator_id"
  end

  create_table "books", force: :cascade do |t|
    t.string  "title",       null: false
    t.string  "description"
    t.string  "language",    null: false
    t.string  "date"
    t.string  "rights"
    t.integer "licenses"
  end

  add_index "books", ["language"], name: "index_books_on_language", using: :btree
  add_index "books", ["title"], name: "index_books_on_title", using: :btree

  create_table "books_sources", force: :cascade do |t|
    t.integer "book_id"
    t.integer "source_id"
    t.string  "identification"
    t.string  "download_uri"
  end

  create_table "books_subjects", force: :cascade do |t|
    t.integer "book_id"
    t.integer "subject_id"
  end

  create_table "creators", force: :cascade do |t|
    t.string "name", null: false
  end

  add_index "creators", ["name"], name: "index_creators_on_name", using: :btree

  create_table "sources", force: :cascade do |t|
    t.string "name", null: false
  end

  create_table "subjects", force: :cascade do |t|
    t.string "description"
  end

  add_index "subjects", ["description"], name: "index_subjects_on_description", using: :btree

end
