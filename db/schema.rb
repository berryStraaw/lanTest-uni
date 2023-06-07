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

ActiveRecord::Schema[7.0].define(version: 2023_06_07_094612) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "groups", force: :cascade do |t|
    t.bigint "language_id", null: false
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["language_id"], name: "index_groups_on_language_id"
  end

  create_table "groups_tests", force: :cascade do |t|
    t.bigint "test_id", null: false
    t.bigint "group_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_groups_tests_on_group_id"
    t.index ["test_id"], name: "index_groups_tests_on_test_id"
  end

  create_table "languages", force: :cascade do |t|
    t.string "language"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_languages_on_user_id"
  end

  create_table "tests", force: :cascade do |t|
    t.bigint "group_id", null: false
    t.string "name"
    t.string "answers", default: [], array: true
    t.string "input", default: [], array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["group_id"], name: "index_tests_on_group_id"
    t.index ["user_id"], name: "index_tests_on_user_id"
  end

  create_table "tests_words", force: :cascade do |t|
    t.bigint "word_id", null: false
    t.bigint "test_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["test_id"], name: "index_tests_words_on_test_id"
    t.index ["word_id"], name: "index_tests_words_on_word_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "words", force: :cascade do |t|
    t.bigint "group_id", null: false
    t.string "name"
    t.string "meaning"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_words_on_group_id"
  end

  add_foreign_key "groups", "languages"
  add_foreign_key "groups_tests", "groups"
  add_foreign_key "groups_tests", "tests"
  add_foreign_key "languages", "users"
  add_foreign_key "tests", "groups"
  add_foreign_key "tests", "users"
  add_foreign_key "tests_words", "tests"
  add_foreign_key "tests_words", "words"
  add_foreign_key "words", "groups"
end
