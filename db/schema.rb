# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_08_09_023902) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "choices", force: :cascade do |t|
    t.string "content"
    t.boolean "is_answer", default: false
    t.bigint "question_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["question_id"], name: "index_choices_on_question_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string "content", null: false
    t.bigint "quize_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["quize_id"], name: "index_questions_on_quize_id"
  end

  create_table "quizes", force: :cascade do |t|
    t.string "title", null: false
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_quizes_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "user_name", null: false
    t.string "email", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "choices", "questions"
  add_foreign_key "questions", "quizes"
end
