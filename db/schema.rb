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

ActiveRecord::Schema.define(version: 2019_02_11_150653) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "equations", force: :cascade do |t|
    t.string "equation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "veracity"
  end

  create_table "memory_questions", force: :cascade do |t|
    t.bigint "memory_survey_id"
    t.integer "memory"
    t.boolean "veracity"
    t.integer "recall"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "equation_id"
    t.index ["equation_id"], name: "index_memory_questions_on_equation_id"
    t.index ["memory_survey_id"], name: "index_memory_questions_on_memory_survey_id"
  end

  create_table "memory_surveys", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "survey_id"
    t.integer "number_of_questions"
    t.index ["survey_id"], name: "index_memory_surveys_on_survey_id"
  end

  create_table "reading_questions", force: :cascade do |t|
    t.bigint "reading_survey_id"
    t.integer "memory"
    t.integer "recall"
    t.bigint "sentence_id"
    t.boolean "veracity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["reading_survey_id"], name: "index_reading_questions_on_reading_survey_id"
    t.index ["sentence_id"], name: "index_reading_questions_on_sentence_id"
  end

  create_table "reading_surveys", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "survey_id"
    t.index ["survey_id"], name: "index_reading_surveys_on_survey_id"
  end

  create_table "sentences", force: :cascade do |t|
    t.text "sentence"
    t.boolean "veracity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "settings", force: :cascade do |t|
    t.boolean "allow_retake"
    t.integer "delay"
    t.integer "maximum_value"
    t.integer "minimum_value"
    t.integer "number_questions"
    t.integer "number_surveys"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "surveys", force: :cascade do |t|
    t.integer "subject"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "two"
    t.integer "three"
    t.integer "four"
    t.integer "five"
    t.integer "six"
    t.integer "seven"
  end

  add_foreign_key "memory_questions", "equations"
  add_foreign_key "memory_questions", "memory_surveys"
  add_foreign_key "memory_surveys", "surveys"
  add_foreign_key "reading_questions", "reading_surveys"
  add_foreign_key "reading_questions", "sentences"
  add_foreign_key "reading_surveys", "surveys"
end
