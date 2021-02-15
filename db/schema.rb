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

ActiveRecord::Schema.define(version: 2021_02_14_211057) do

  create_table "articles", charset: "latin1", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "status", default: "public"
  end

  create_table "cities", charset: "latin1", force: :cascade do |t|
    t.string "name"
    t.date "visit_date"
    t.text "review"
    t.integer "rating"
    t.float "lat"
    t.float "long"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "comments", charset: "latin1", force: :cascade do |t|
    t.string "commenter"
    t.text "body"
    t.bigint "article_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "status", default: "public"
    t.index ["article_id"], name: "index_comments_on_article_id"
  end

  create_table "dinings", charset: "latin1", force: :cascade do |t|
    t.string "name"
    t.date "visit_date"
    t.text "review"
    t.integer "rating"
    t.float "lat"
    t.float "long"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "journals", charset: "latin1", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.float "lat"
    t.float "long"
    t.date "date"
    t.boolean "floating"
    t.bigint "track_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["track_id"], name: "index_journals_on_track_id"
  end

  create_table "parks", charset: "latin1", force: :cascade do |t|
    t.string "name"
    t.date "visit_date"
    t.text "review"
    t.integer "rating"
    t.float "lat"
    t.float "long"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "pitstops", charset: "latin1", force: :cascade do |t|
    t.string "name"
    t.date "visit_date"
    t.text "review"
    t.integer "rating"
    t.float "lat"
    t.float "long"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "shoppings", charset: "latin1", force: :cascade do |t|
    t.string "name"
    t.date "visit_date"
    t.text "review"
    t.integer "rating"
    t.float "lat"
    t.float "long"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tracks", charset: "latin1", force: :cascade do |t|
    t.string "filename"
    t.date "date"
    t.float "distance"
    t.float "elev_change"
    t.integer "duration"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "comments", "articles"
  add_foreign_key "journals", "tracks"
end
